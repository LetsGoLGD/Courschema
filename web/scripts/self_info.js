function load()	{
    let name = document.getElementById("name");
    let uid = document.getElementById("uid");
    let gender = document.getElementById("gender");
    let grade = document.getElementById("grade");
    let major = document.getElementById("major");
    let college = document.getElementById("college");
    let course = document.getElementById("course");
    let board = document.getElementById("board");

    name.innerHTML = "Name: ";
    uid.innerHTML = "UID: ";
    gender.innerHTML = "Gender: ";
    grade.innerHTML = "Grade: ";
    major.innerHTML = "Major: ";
    college.innerHTML = "College: ";
    // 设置学号等个人信息

    let newCourse = document.createElement("span");
    newCourse.innerHTML = "OOAD";
    course.appendChild(newCourse);
    //添加修过的课程，套个for循环就行

    let newNotice = document.createElement("span");
    newNotice.innerHTML = "Added course OOAD";
    board.appendChild(newNotice);
    //添加公告，套个for循环就行
}