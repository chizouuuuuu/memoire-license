<?php
// Connexion à la base de données
$host = 'localhost';
$dbname = 'ophtalearning';
$username = 'root';
$password = ''; // <-- change si besoin

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "<h3>Connexion réussie ✅</h3>";

    // ----------- 1. PROFESSEUR ------------
    $stmt = $pdo->prepare("INSERT INTO professeur (id_utilisateur, specialite, grade_academique, date_embauche) 
                           VALUES (?, ?, ?, ?)");
    $stmt->execute([3, 'Ophtalmologie', 'Assistant', '2022-01-01']);

    // ----------- 2. ETUDIANT ---------------
    $stmt = $pdo->prepare("INSERT INTO etudiant (id_etudiant, niveau_etude, date_inscription, platforme) 
                           VALUES (?, ?, ?, ?)");
    $stmt->execute([103, '4e année médecine', '2025-02-10', 'OphtaLearning']);

    // ----------- 3. COURS ------------------
    $stmt = $pdo->prepare("INSERT INTO cours (id_cours, id_utilisateur, titre, categorie, date_creation, duree_cour, heure, nombre_etudiants, ` description`) 
                           VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([1003, 3, 'Physiopathologie des uvéites', 'Uvéites avancées', '2025-04-01', 3, '10:00:00', 0, 40]);

    // ----------- 4. QUIZ -------------------
    $stmt = $pdo->prepare("INSERT INTO quiz (id_quiz, titre, duree, id_cours, question) 
                           VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([3001, 'Quiz sur les traitements', 20, 1003, "Quel est le traitement de première intention pour une uvéite non infectieuse ?"]);

    // ----------- 5. INSCRIE ----------------
    $stmt = $pdo->prepare("INSERT INTO inscrie (id_etudiant, id_cours, date_inscription, note, progression) 
                           VALUES (?, ?, ?, ?, ?)");
    $stmt->execute([103, 1003, '2025-05-20', 16.5, 80]);

    // ----------- 6. FAIRE ------------------
    $stmt = $pdo->prepare("INSERT INTO faire (id_utilisateur, id_quiz, score, date_passe) 
                           VALUES (?, ?, ?, ?)");
    $stmt->execute([3, 3001, 9.0, '2025-05-30']);

    echo "<p>Toutes les données ont été insérées avec succès dans les 6 tables ✅</p>";

} catch (PDOException $e) {
    echo "<p>❌ Erreur : " . $e->getMessage() . "</p>";
}
?>
