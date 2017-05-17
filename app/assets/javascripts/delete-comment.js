$(document).ready(function(){
  $('.delete-comment').on("click",function(e){
    $.ajax({
      url: '/comments/' + $(this).data('commentid'),
      type: 'delete',
      success: function(result){
        var parent = document.getElementById('comment_list');
        var node = document.getElementById('edit_comment_' + result.comment_id);
        parent.removeChild(node);
      },
      error: function(result){
        alert(I18n.t('javascript.error_comment') + result.reason);
      }
    });
  })
});
