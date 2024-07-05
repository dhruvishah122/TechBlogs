function doLike(pid, uid) {
  console.log(pid);
  console.log(uid);
    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    };
    

    $.ajax({
        url: "like_servlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }


    });
    }