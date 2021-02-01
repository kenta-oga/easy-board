function read() {
  const read = document.getElementById("read");
  read.addEventListener("click", () => {
    const postId = read.getAttribute("data--post-id");
    // const userId = read.getAttribute("data-user-id");
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/groups/posts/${postId}`, true);
    XHR.responseType = "json";
    XHR.send();
  });
}
window.addEventListener("load", read);