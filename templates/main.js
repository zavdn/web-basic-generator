const folders = "FILELIST";
const folders_arr = folders.split(",");
const mainDiv = document.getElementById("main");

// document.querySelector("body").style.backgroundColor = "red"
const allEvents = []

folders_arr.forEach((path, i) => {
  const iframeDiv   = document.createElement("div")
  const sizeDiv     = document.createElement("div")
  const sizeSpan    = document.createElement("span")
  const title       = document.createElement("h2")
  const titleName   = path.slice(6, path.length)
  const notes       = document.createElement("code")
  //
  title.innerHTML = `
    <a href="./src/${path}/" target="_blank">${i+1} - ${titleName}</a>
  `
  iframeDiv.classList = "resizable"
  iframeDiv.innerHTML = `<iframe src="./src/${path}/"></iframe>`
  sizeSpan.innerText = "Size: "
  notes.id = `code-${i}`
  // Listeners
  sizeDiv.appendChild(sizeSpan)
  mainDiv.appendChild(title)
  mainDiv.appendChild(sizeDiv)
  mainDiv.appendChild(iframeDiv)
  mainDiv.appendChild(notes)
  //
  const iframeEvent = () => {
    sizeSpan.textContent = "Width: "
                           + iframeDiv.clientWidth
                           + " px, Height: "
                           + iframeDiv.clientHeight 
                           + " px"
  }
  iframeDiv.addEventListener("mousemove", iframeEvent)
  allEvents.push(iframeEvent)
  fetch(`./src/${path}/notes.txt`)
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.text();
    })
    .then(text => {
      const codeElement = document.getElementById(`code-${i}`);
      codeElement.innerHTML = "<pre>" + text + "</pre>";
    })
    .catch(error => {
      console.error('There was a problem with the fetch operation:', error);
    });
})


window.onload = function() {
  allEvents.forEach(e => e())
}
