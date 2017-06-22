$(document).ready(function() {
  $(".upvote").on("click", (function(event) {
    vote(true);
  }));
  $(".downvote").on("click", (function(event) {
    vote(false);
  }));
});

function vote(vote) {
  event.preventDefault();
  var url = document.documentURI;
  var venueId = url.substring(url.lastIndexOf('/') + 1);
  reviewId = this.document.activeElement.attributes.id.value;

  var request = $.ajax({
    method: "POST",
    url: '/api/v1/venues/' + venueId + '/reviews/' + reviewId + '/votes',
    data: { vote: vote }
  });

  request.done(function(data) {
    document.getElementById("score_" + reviewId).innerHTML = "Score: " + data.score
  });
}
