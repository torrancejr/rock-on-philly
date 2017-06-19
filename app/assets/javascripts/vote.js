$(document).ready(function() {
  $(".upvote").on("click", (function(event) {
    vote(true);
  }))
  $(".downvote").on("click", (function(event) {
    vote(false);
  }))
});

function vote(vote) {
  event.preventDefault();
  debugger;
  reviewId = this.document.activeElement.attributes.id.value

  var request = $.ajax({
    method: "POST",
    url: '/api/v1/venues/' + venue.id + '/reviews' + review.id + '/votes',
    data: { vote: vote }
  });

  request.done(function(data) {
    document.getElementById("score_" + reviewId).innerHTML = "Score: " + data.score
  });
}
