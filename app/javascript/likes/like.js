const initLikeListener = () => {
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const likes = document.querySelectorAll(".like_subscribe")

  for (let i = 0; i < likes.length; i++) {
    likes[i].addEventListener("click", function() {
      const postId = likes[i].getAttribute("data-post-id");
      if (likes[i].classList.contains("liked")) {
        fetch(`/posts/${postId}/likes/0`, {
          method: "DELETE",
          headers: {
            'X-CSRF-Token': token
          },
        });
        likes[i].innerHTML = "<i class='far fa-heart'></i>";
      } else {
        fetch(`/posts/${postId}/likes`, {
          method: "POST",
          headers: {
            'X-CSRF-Token': token
          },
        });
        likes[i].innerHTML = "<i class='fas fa-heart'></i>";
      }
      likes[i].classList.toggle("liked");
    })
  }
}

export { initLikeListener };
