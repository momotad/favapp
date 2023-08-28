import consumer from "./consumer"

// const comment = () => {
if(location.pathname.match(/\/list\/\d/)){
  consumer.subscriptions.create({
    channel: "CommentChannel",
    id: location.pathname.match(/\d+/)[0]
  }, {

  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
    <div class="comment">
      <p class="user-info">${data.user.name}： </p>
      <p>${data.comment.content}</p>
    </div>`
  const comments = document.getElementById("comments")
  comments.insertAdjacentHTML('beforeend', html)
  const commentForm = document.getElementById("comment-form")
  commentForm.reset();
  }
})
}
// };

// window.addEventListener("turbo:load", comment);