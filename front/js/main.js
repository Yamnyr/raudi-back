// main.js

import { getAllModels } from './api.js';

document.addEventListener('DOMContentLoaded', () => {
    const modelListElement = document.getElementById('modelList');

    // Appelle la fonction pour récupérer tous les modèles depuis l'API
    getAllModels()
        .then(models => {
            // Manipule les données et affiche-les sur la page
            models.forEach(model => {
                const li = document.createElement('li');
                li.textContent = model.name; // Supposons que le modèle a une propriété "name"
                modelListElement.appendChild(li);
            });
        });
});
