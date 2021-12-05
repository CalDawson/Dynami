const like = document.querySelector(".like_subscribe")
const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');


like.addEventListener("click", function() {
  const postId = like.getAttribute("data-post-id");
  if (like.classList.contains("liked")) {
    fetch(`/posts/${postId}/likes/0`, {
      method: "DELETE",
      headers: {
        'X-CSRF-Token': token
      },
    });
  } else {
    fetch(`/posts/${postId}/likes`, {
      method: "POST",
      headers: {
        'X-CSRF-Token': token
      },
    });
  }
  like.classList.toggle("liked");
})
