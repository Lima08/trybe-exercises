let header = document.querySelector('#header-container');
/* console.log(header) */
header.style.backgroundColor = 'green';

let emergencyTasks = document.querySelector('.emergency-tasks');
/* console.log(emergencyTasks); */
emergencyTasks.style.backgroundColor = 'orange'

let firstH3important = document.getElementsByTagName( 'h3')[0];
firstH3important.style.backgroundColor = 'purple';

let secondH3Important = document.getElementsByTagName( 'h3')[1];
secondH3Important.style.backgroundColor = 'purple';

let firstH3NoImportant = document.getElementsByTagName( 'h3')[2];
firstH3NoImportant.style.backgroundColor = 'black';

let secondH3NoImportant = document.getElementsByTagName( 'h3')[3];
secondH3NoImportant.style.backgroundColor = 'black';

let noEmergencyTasks = document.querySelector('.no-emergency-tasks');
/* console.log(noEmergencyTasks); */
noEmergencyTasks.style.backgroundColor = 'yellow';

let footer = document.querySelector('#footer-container');
footer.style.backgroundColor = 'darkgreen'



