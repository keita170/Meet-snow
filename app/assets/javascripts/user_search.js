/*global $*/
/*global location*/

//URLに/usersが含まれていない時の処理ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
$(document).on('turbolinks:load', function(){
  const inputForm = $('.search_user');
  const url = location.href;
  const searchResult = $('#result_user');

  function builtHTML(data){
    let html = `
        <div class="col-md-5 d-flex align-items-center justify-content-center offset-md-2">
          <a href="users/${data.id}" class="link text-center ml-5">${data.name}:<span class="font-weight-bold">${data.status}</span></a>
        </div>
    `
    searchResult.append(html);
  }

  function NoResult(message){
    let html = `
    <div class="col-md-5 offset-md-4"><br>
    <p>${message}</p><br>
    </duv>
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
      url: '/users/search',
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
        NoResult('該当するユーザーはいません')
      }
    })
    .fail(function(data){
      alert('非同期通信に失敗しました');
    })
  }
});

// URLに/usesが含まれている時の処理ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
$(document).on('turbolinks:load', function(){
  const inputForm = $('.search_user_user');
  const url = location.href;
  const searchResult = $('#result_user');

  function builtHTML(data){
    let html = `
        <div class="col-md-5 d-flex align-items-center justify-content-center offset-md-2">
          <a href="${data.id}" class="link text-center ml-5">${data.name}:<span class="font-weight-bold">${data.status}</span></a>
        </div>
    `
    searchResult.append(html);
  }

  function NoResult(message){
    let html = `
    <div class="col-md-5 offset-md-4"><br>
    <p>${message}</p><br>
    </duv>
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
      url: '/users/search',
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
        NoResult('該当するユーザーはいません')
      }
    })
    .fail(function(data){
      alert('非同期通信に失敗しました');
    })
  }
});
