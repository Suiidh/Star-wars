document.addEventListener("DOMContentLoaded", function() {
    // Check if page was reloaded
    if (window.performance && performance.getEntriesByType("navigation").length > 0) {
        if (performance.getEntriesByType("navigation")[0].type === 'reload') {
            sessionStorage.removeItem("sithMode");
        }
    } else if (window.performance && performance.navigation.type === 1) {
        // Fallback for older browsers
        sessionStorage.removeItem("sithMode");
    }

    // Check for Sith Mode in Session Storage
    if (sessionStorage.getItem("sithMode") === "true") {
        document.body.classList.add("konami-active");
        revealSithContent();
    }
});

function revealSithContent() {
    const sithCard = document.getElementById("sith-quiz-card");
    if (sithCard) {
        sithCard.style.display = "flex"; // Or 'block' depending on layout
        sithCard.classList.add("revealed-sith");
    }
}

// Function to toggle Sith Mode (can be called from Konami code)
function enableSithMode() {
    if (document.body.classList.contains("konami-active")) return; // Already active
    
    document.body.classList.add("konami-active");
    sessionStorage.setItem("sithMode", "true");
    revealSithContent();
    
    // Audio Effect (Saber on)
    try {
        const audioCtx = new (window.AudioContext || window.webkitAudioContext)();
        const oscillator = audioCtx.createOscillator();
        const gainNode = audioCtx.createGain();
        
        oscillator.type = 'sawtooth';
        oscillator.frequency.setValueAtTime(100, audioCtx.currentTime);
        oscillator.frequency.exponentialRampToValueAtTime(50, audioCtx.currentTime + 0.5);
        
        gainNode.gain.setValueAtTime(0.1, audioCtx.currentTime);
        gainNode.gain.exponentialRampToValueAtTime(0.001, audioCtx.currentTime + 0.5);
        
        oscillator.connect(gainNode);
        gainNode.connect(audioCtx.destination);
        oscillator.start();
        oscillator.stop(audioCtx.currentTime + 0.6);
    } catch(e) {
        console.log("Audio not supported or blocked");
    }

    alert("🚨 ALERTE GÉNÉRALE ! 🚨\n\nVous êtes passé du Côté Obscur de la Force !\n(Sith Mode Activated)");
}
