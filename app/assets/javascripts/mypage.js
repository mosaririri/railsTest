/**
 * 実施ボタンを追加する
 */
function addRunButton() {
    const today = moment(new Date()).format('YYYY-MM-DD');
    const todayCell = document.querySelector('[data-date="' + today + '"]'); 

    // 事前チェック
    if (!todayCell) return; 
    if(todayCell.querySelector('#run-button')) return;
    
    // const runButtonDummy = document.getElementById('run-button');
    const runButtonDummy = document.querySelector('#run-button.dummy')
    const runButtonClone = runButtonDummy.cloneNode(true);
    runButtonClone.classList.remove("dummy");
    todayCell.append(runButtonClone);

}

window.addEventListener('load', (event) => {

    // 読み込み後に実行ボタン配置
    addRunButton();

     // 実行ボタン押下処理関連
    const runButton = document.getElementById('calendar').querySelector('#run-button button');
    console.log(runButton);

    // 実行ボタン配置関連
    const scrollMonthButton = document.querySelector('.fc-right');
    scrollMonthButton.addEventListener('click', (event) => {
        addRunButton();
        const runButton = document.getElementById('calendar').querySelector('#run-button button');

        if(!runButton) return;

        // スクロール後のイベントも設定する
        runButton.addEventListener('click', (event) => {
            // 日付を取得して実行テーブルに登録する
            console.log(runButton.parentNode.parentNode.getAttribute('data-date'));
        });

    });


   
    runButton.addEventListener('click', (event) => {
        // 日付を取得して実行テーブルに登録する
        console.log(runButton.parentNode.parentNode.getAttribute('data-date'));
    });

    // json化したタスクを取得し、タスク表に反映する
    const tasks = JSON.parse(document.getElementById("task-holder").getAttribute("data-tasks"));
    
   
    tasks.map((task) => {

        const executeTime = String(task.execute_time).length === 3 ? "0" + task.execute_time : task.execute_time;
        
        const targetTaskList = document.getElementById(executeTime);

        targetTaskList.append(task.content);
        targetTaskList.classList.add('has-task');
        console.log(targetTaskList);
        
    });
    

});

