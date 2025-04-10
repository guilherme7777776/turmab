// Funções para manipulação do placar e do histórico
document.addEventListener('DOMContentLoaded', () => {
    let scoreA = 0;
    let scoreB = 0;
    let setA = 0;
    let setB = 0;

    const scoreAElement = document.getElementById('scoreA');
    const scoreBElement = document.getElementById('scoreB');
    const setAElement = document.getElementById('setA');
    const setBElement = document.getElementById('setB');
    const historicoElement = document.getElementById('historico');
    const resetBtn = document.getElementById('resetBtn');
    const btnAplus = document.getElementById('btnAplus');
    const btnAminus = document.getElementById('btnAminus');
    const btnAsetplus = document.getElementById('btnAsetplus');
    const btnAsetminus = document.getElementById('btnAsetminus');
    const btnBplus = document.getElementById('btnBplus');
    const btnBminus = document.getElementById('btnBminus');
    const btnBsetplus = document.getElementById('btnBsetplus');
    const btnBsetminus = document.getElementById('btnBsetminus');
    const nomeAInput = document.getElementById('nomeA');
    const nomeBInput = document.getElementById('nomeB');
    const timeAName = document.getElementById('timeAName');
    const timeBName = document.getElementById('timeBName');

    // Atualiza os nomes das equipes quando os inputs mudam
    nomeAInput.addEventListener('input', () => {
        timeAName.textContent = nomeAInput.value || 'Equipe A';
    });

    nomeBInput.addEventListener('input', () => {
        timeBName.textContent = nomeBInput.value || 'Equipe B';
    });

    // Função para atualizar o placar e o histórico
    function updatePlacar() {
        scoreAElement.textContent = scoreA;
        scoreBElement.textContent = scoreB;
        setAElement.textContent = `Set: ${setA}`;
        setBElement.textContent = `Set: ${setB}`;

        // Verifica se algum time atingiu 25 pontos e venceu
        if (scoreA >= 25 && scoreA === scoreB+2) {
            alert(`${timeAName.textContent} venceu o set!`);
            setA++;
            resetPlacar();
        } else if (scoreB >= 25 && scoreB === scoreA+2) {
            alert(`${timeBName.textContent} venceu o set!`);
            setB++;
            resetPlacar();
        }
    }

    function updateHistorico(time, pontos) {
        const historicoDiv = document.createElement('div');
        historicoDiv.textContent = `${time} marcou ${pontos} ponto(s)`;
        historicoElement.appendChild(historicoDiv);
    }

    // Função para resetar o placar
    function resetPlacar() {
        scoreA = 0;
        scoreB = 0;
        updatePlacar();
        historicoElement.innerHTML = '';
    }

    // Ações para o Time A
    btnAplus.addEventListener('click', () => {
        scoreA++;
        updatePlacar();
        updateHistorico(timeAName.textContent, 1);
    });

    btnAminus.addEventListener('click', () => {
        if (scoreA > 0) {
            scoreA--;
            updatePlacar();
            updateHistorico(timeAName.textContent, -1);
        }
    });

    btnAsetplus.addEventListener('click', () => {
        setA++;
        updatePlacar();
        updateHistorico(timeAName.textContent, 'Set +1');
    });

    btnAsetminus.addEventListener('click', () => {
        if (setA > 0) {
            setA--;
            updatePlacar();
            updateHistorico(timeAName.textContent, 'Set -1');
        }
    });

    // Ações para o Time B
    btnBplus.addEventListener('click', () => {
        scoreB++;
        updatePlacar();
        updateHistorico(timeBName.textContent, 1);
    });

    btnBminus.addEventListener('click', () => {
        if (scoreB > 0) {
            scoreB--;
            updatePlacar();
            updateHistorico(timeBName.textContent, -1);
        }
    });

    btnBsetplus.addEventListener('click', () => {
        setB++;
        updatePlacar();
        updateHistorico(timeBName.textContent, 'Set +1');
    });

    btnBsetminus.addEventListener('click', () => {
        if (setB > 0) {
            setB--;
            updatePlacar();
            updateHistorico(timeBName.textContent, 'Set -1');
        }
    });

    // Resetar placar
    resetBtn.addEventListener('click', resetPlacar);

    // Inicializar o placar
    updatePlacar();
});


