document.addEventListener('turbo:load', function() {
  const playList = document.querySelectorAll("img.play");
  playList.forEach(function(play) {
    play.addEventListener('click', function() {
      let post_id = this.id
      fetch(`/api/translated_texts/${post_id}`)
        .then(response => response.json())
        .then(data => {
          const uttr = new SpeechSynthesisUtterance(data.translated_text)
          speechSynthesis.speak(uttr)
        });
    });
  });
})