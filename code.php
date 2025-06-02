<?php
// Connexion à la base de données
$host = 'localhost';
$dbname = 'ophtalearning';
$username = 'root';
$password = ''; // à adapter si besoin

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "<h3>✅ Connexion réussie</h3>";

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // 1. INSCRIPTION UTILISATEUR
        if (isset($_POST['register'])) {
            $role = $_POST['role'];
            $nom = $_POST['nom'];
            $prenom = $_POST['prenom'];
            $email = $_POST['email'];
            $id = rand(100, 999); // ID temporaire auto-généré
            $date = date('Y-m-d');

            if ($role === 'prof') {
                $stmt = $pdo->prepare("INSERT INTO professeur (id_utilisateur, specialite, grade_academique, date_embauche, nomP, prenomP, dateP, lieunP, emailP, numtelP, anneexpP, cv, diplome, etabli)
                                       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '', '', '')");
                $stmt->execute([$id, 'Ophtalmologie', 'Assistant', $date, $nom, $prenom, '1990-01-01', 'ville', $email, 600000000, 1]);
                echo "<p>👨‍🏫 Professeur inscrit avec ID $id</p>";
            } else {
                $stmt = $pdo->prepare("INSERT INTO etudiant (id_etudiant, niveau_etude, date_inscription, nom, prenom, daten, lieun, email, numtel, nummat, anneetudeact, certificat)
                                       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '')");
                $stmt->execute([$id, 'Médecine', $date, $nom, $prenom, '2000-01-01', 'ville', $email, 600000000, rand(100000,999999), 2025]);
                echo "<p>🎓 Étudiant inscrit avec ID $id</p>";
            }
        }

        // 2. CRÉATION DE COURS PAR PROFESSEUR
        if (isset($_POST['create_course'])) {
            $id_cours = rand(1000, 9999);
            $id_utilisateur = $_POST['id_prof'];
            $titre = $_POST['titre'];
            $categorie = $_POST['categorie'];
            $date_creation = date('Y-m-d');
            $stmt = $pdo->prepare("INSERT INTO cours (id_cours, id_utilisateur, titre, categorie, date_creation, duree_cour, heure, nombre_etudiants, ` description`)
                                   VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([$id_cours, $id_utilisateur, $titre, $categorie, $date_creation, 2, '10:00:00', 0, 30]);
            echo "<p>📘 Cours '$titre' créé avec ID $id_cours</p>";
        }

        // 3. INSCRIPTION ÉTUDIANT À UN COURS
        if (isset($_POST['inscrire_etudiant'])) {
            $id_etudiant = $_POST['id_etudiant'];
            $id_cours = $_POST['id_cours'];
            $date = date('Y-m-d');
            $stmt = $pdo->prepare("INSERT INTO inscrie (id_etudiant, id_cours, date_inscription, note, progression)
                                   VALUES (?, ?, ?, ?, ?)");
            $stmt->execute([$id_etudiant, $id_cours, $date, 0, 0]);
            echo "<p>✅ Étudiant $id_etudiant inscrit au cours $id_cours</p>";
        }
    }
} catch (PDOException $e) {
    echo "<p>❌ Erreur : " . $e->getMessage() . "</p>";
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>OphtaLearning - Gestion</title>
</head>
<body>
    <h2>📝 Inscription (Professeur ou Étudiant)</h2>
    <form method="post">
        Rôle :
        <select name="role">
            <option value="prof">Professeur</option>
            <option value="etudiant">Étudiant</option>
        </select><br>
        Nom : <input type="text" name="nom"><br>
        Prénom : <input type="text" name="prenom"><br>
        Email : <input type="email" name="email"><br>
        <button type="submit" name="register">S'inscrire</button>
    </form>

    <h2>📘 Création de cours (Professeur)</h2>
    <form method="post">
        ID Professeur : <input type="number" name="id_prof"><br>
        Titre du cours : <input type="text" name="titre"><br>
        Catégorie : <input type="text" name="categorie"><br>
        <button type="submit" name="create_course">Créer le cours</button>
    </form>

    <h2>🎓 Inscription étudiant à un cours</h2>
    <form method="post">
        ID Étudiant : <input type="number" name="id_etudiant"><br>
        ID Cours : <input type="number" name="id_cours"><br>
        <button type="submit" name="inscrire_etudiant">S’inscrire</button>
    </form>
</body>
</html>
