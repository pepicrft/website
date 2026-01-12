+++
title = "Setting up PeerTube with Cloudflare R2 Object Storage"
description = "A step-by-step guide to configuring PeerTube with Cloudflare R2 for reliable video storage and streaming, including migration tips and troubleshooting."
tags = ["PeerTube", "Cloudflare", "R2", "Object Storage", "Video Hosting", "Self-hosting"]
published_at = "2025-06-12T12:00:00+00:00"
+++

I recently spent considerable time integrating [Tuist Videos](https://videos.tuist.dev/) (our [PeerTube](https://joinpeertube.org/) instance) with Cloudflare R2 object storage. The motivation was simple: users were experiencing playback interruptions due to connection drops, and I wanted a more robust storage solution.

This guide captures the configuration process for anyone facing similar challenges or looking to leverage R2's reliability for their PeerTube instance.

## Prerequisites

Before diving into the configuration, ensure you have: - A Cloudflare R2 bucket created - R2 API access keys (Access Key ID and Secret Access Key) - Administrative access to your PeerTube instance

## Configuration

The core configuration happens in your PeerTube instance's `default.yml` file. Add the following `object_storage` section at the root level:

```
object_storage:
 enabled: true
 endpoint: '{your-account-id}.r2.cloudflarestorage.com'
 region: 'auto'
 credentials:
 access_key_id: 'your-access-key-id'
 secret_access_key: 'your-secret-access-key'
 upload_acl:
 public: null # R2 doesn't support S3 ACLs
 private: null
 max_upload_part: 100MB
 max_request_attempts: 3
 web_videos:
 bucket_name: 'tuist-videos'
 prefix: 'web-videos/'
 base_url: 'https://storage.videos.tuist.dev'
 videos:
 bucket_name: 'tuist-videos'
 prefix: 'videos/'
 base_url: 'https://storage.videos.tuist.dev'
 streaming_playlists:
 bucket_name: 'tuist-videos'
 prefix: 'streaming-playlists/'
 base_url: 'https://storage.videos.tuist.dev'
 store_live_streams: true
 user_exports:
 bucket_name: 'tuist-exports'
 prefix: 'user-exports/'
 base_url: 'https://storage.videos.tuist.dev'
 original_video_files:
 bucket_name: 'tuist-videos'
 prefix: 'original-video-files/'
 base_url: 'https://storage.videos.tuist.dev'
 captions:
 bucket_name: 'tuist-videos'
 prefix: 'captions/'
 base_url: 'https://storage.videos.tuist.dev'
```

## Key Configuration Notes

**Bucket Strategy**: I opted to use a single bucket (`tuist-videos`) for most content types, organizing them with prefixes. This simplifies management while maintaining logical separation.

**Custom Domain**: The `base_url` configuration is crucial for avoiding CORS issues. Set up a custom domain for your R2 bucket through Cloudflare's dashboard and use it here. The default R2 URLs can cause CORS problems that are difficult to resolve with policy adjustments alone.

**ACL Settings**: R2 doesn't support S3-style ACLs, so both `public` and `private` values should be set to `null`.

## Migrating Existing Videos

If you have existing videos to migrate, PeerTube provides a convenient npm script:

```
NODE_CONFIG_DIR=/app/code/server/config \
NODE_ENV=production \
npm run create-move-video-storage-job -- --to-object-storage --all-videos
```

Adjust the `NODE_CONFIG_DIR` path to match your PeerTube installation's configuration directory.

## Deployment and Validation

After updating the configuration:

1. Restart your PeerTube service to load the new settings 2. Test by uploading a new video or accessing previously migrated content 3. Monitor the admin "Jobs" page for any migration failures 4. Check application logs if issues arise

The integration should provide more reliable video delivery, especially for users experiencing network instability. The combination of Cloudflare's global CDN and R2's storage reliability creates a robust foundation for video hosting.

## Troubleshooting

If videos aren't loading properly after the migration, check: - Custom domain DNS configuration - R2 bucket permissions - PeerTube job queue for failed migrations - Application logs for specific error messages

The admin interface's jobs section is particularly helpful for diagnosing storage-related issues during and after the migration process.
