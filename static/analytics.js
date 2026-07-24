(() => {
  const configurationRoot = "/.well-known/smolanalytics"

  Promise.all([
    fetch(`${configurationRoot}/host`, {cache: "no-store"}).then(response => {
      if (!response.ok) throw new Error(`host returned ${response.status}`)
      return response.text()
    }),
    fetch(`${configurationRoot}/write-key`, {cache: "no-store"}).then(response => {
      if (!response.ok) throw new Error(`write key returned ${response.status}`)
      return response.text()
    }),
  ])
    .then(([rawHost, rawWriteKey]) => {
      const host = rawHost.trim().replace(/\/$/, "")
      const writeKey = rawWriteKey.trim()
      if (!host || !writeKey) throw new Error("configuration is empty")

      const sdk = document.createElement("script")
      sdk.src = `${host}/sdk.js`
      sdk.async = true
      sdk.addEventListener("load", () => {
        window.smolanalytics?.init(writeKey, {host, anonymous: true})
      })
      sdk.addEventListener("error", () => {
        console.warn("smolanalytics: the browser client could not be loaded")
      })
      document.head.appendChild(sdk)
    })
    .catch(error => {
      console.warn(`smolanalytics: analytics is not configured (${error.message})`)
    })
})()
