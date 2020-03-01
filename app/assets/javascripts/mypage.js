/**
 * 実施ボタンを追加する
 */
function addRunButton() {
    const today = moment(new Date()).format('YYYY-MM-DD');
    const todayCell = document.querySelector('[data-date="' + today + '"]'); 

    if (!todayCell) return; 
    
    const runButton = document.getElementById('run-button');
    const runButtonClone = runButton.cloneNode(true);
    todayCell.append(runButtonClone);

}

window.addEventListener('load', (event) => {
    addRunButton();

    const scrollMonthButton = document.querySelector('.fc-button-group');
    scrollMonthButton.addEventListener('click', (event) => {
        addRunButton();
    });

});

