const like = document.querySelector(".like_subscribe")
const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');


like.addEventListener("click", function() {
  like.classList.toggle("liked");
  const postId = like.getAttribute("data-post-id");
  fetch(`/posts/${postId}/likes`, {
    method: "POST",
    headers: {
      'X-CSRF-Token': token
    },
  });
})
