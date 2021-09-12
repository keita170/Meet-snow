/*global $*/
/*global location*/


$(document).on('turbolinks:load', function(){
  const inputForm = $('.search__form__input');
  const url = location.href;
  const searchResult = $('#index');

  function builtHTML(data){
    let html = `
     <div class="card mb-2" style="width: 42rem;">
      <div class="card-body">
        <h5 class="card-title">
          <a href="student_posts/${data.id}">${data.field}</a>:${data.status}
          <script>
          </script>
        </h5>
        <p class="card-text">${data.body}</p>
        <div class="text-muted mb-1">
          <span>条件:${data.title}</span>

        </div>
      </div>
    </div>
    `
    searchResult.append(html);
  }

  function NoResult(message){
    let html = `
    <li>${message}</li>
    `
    searchResult.append(html);
  }

  // フォームに入力すると発火する
  inputForm.on('keyup', function(){
    const target = $(this).val();
    search(target);
  });

  // ajax処理
  function search(target){
    $.ajax({
      type: 'GET',
      url: '/student_posts/search',
      data: {keyword: target},
      dataType: 'json'
    })
    .done(function(data){
      searchResult.empty(); //再度検索した際に前のデータを消す処理
      if (data.length !== 0) {
        data.forEach(function(data) { //dataは配列型に格納されているのでEach文で回す
          builtHTML(data)
        });
      } else {
        NoResult('該当する投稿はありません')
      }
    })
    .fail(function(data){
      alert('非同期通信に失敗しました');
    })
  }
});