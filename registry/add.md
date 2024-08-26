Ajouter une entrée dans le registre de Windows pour un logiciel peut être nécessaire pour diverses raisons, comme l'ajout de paramètres de configuration, l'intégration avec le système ou l'enregistrement du logiciel pour qu'il apparaisse dans la liste des programmes installés.

Voici la procédure pour ajouter une entrée dans le registre pour votre logiciel :

### 1. **Ouvrir l'Éditeur de Registre**
   - Appuyez sur `Win + R` pour ouvrir la boîte de dialogue Exécuter.
   - Tapez `regedit` et appuyez sur Entrée. Cela ouvrira l'Éditeur de Registre de Windows.

### 2. **Naviguer jusqu'à la clé souhaitée**
   Les entrées de registre pour les logiciels se trouvent généralement sous l'une des clés suivantes :
   - **Pour tous les utilisateurs :**
     - `HKEY_LOCAL_MACHINE\Software\`
   - **Pour un utilisateur spécifique :**
     - `HKEY_CURRENT_USER\Software\`

   Choisissez la clé appropriée en fonction de l'installation de votre logiciel (pour tous les utilisateurs ou pour un utilisateur spécifique).

### 3. **Créer une clé pour votre logiciel**
   - Dans le panneau de gauche, cliquez avec le bouton droit sur le dossier `Software`.
   - Sélectionnez `Nouveau` > `Clé`.
   - Donnez à cette nouvelle clé le nom de votre logiciel (ou le nom de votre éditeur si vous souhaitez organiser les sous-clés de manière plus structurée).

### 4. **Ajouter des valeurs à votre clé**
   Une fois que vous avez créé la clé pour votre logiciel, vous pouvez y ajouter des valeurs. Voici quelques exemples courants de valeurs que vous pourriez ajouter :

   - **Nom du logiciel** : Vous pouvez créer une valeur de chaîne (REG_SZ) nommée "Nom" avec le nom de votre logiciel.
   - **Chemin d'installation** : Vous pouvez ajouter une valeur de chaîne (REG_SZ) nommée "Chemin" avec le chemin d'installation du logiciel.
   - **Version** : Ajoutez une valeur de chaîne (REG_SZ) pour stocker la version du logiciel.

   Pour ajouter une valeur :
   - Faites un clic droit dans la partie droite de l'Éditeur de Registre, sélectionnez `Nouveau`, puis choisissez le type de valeur (par exemple, `Valeur de chaîne`).
   - Donnez un nom à la valeur et double-cliquez dessus pour entrer les données associées.

### 5. **Ajouter des paramètres de configuration (facultatif)**
   Si votre logiciel utilise des paramètres spécifiques qui doivent être stockés dans le registre, vous pouvez les ajouter sous votre clé. Ces paramètres peuvent être des chaînes, des nombres, ou des valeurs binaires, selon vos besoins.

### 6. **Intégration avec le système (facultatif)**
   Si vous souhaitez que votre logiciel s'exécute automatiquement au démarrage de Windows, vous pouvez ajouter une entrée dans :
   - `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run`
   - ou
   - `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run`

   Créez une nouvelle valeur de chaîne (REG_SZ) avec le nom de votre logiciel et définissez les données de la valeur sur le chemin complet de l'exécutable de votre logiciel.

### 7. **Fermer l'Éditeur de Registre**
   Une fois que vous avez ajouté toutes les entrées nécessaires, fermez l'Éditeur de Registre. Vos modifications sont automatiquement enregistrées.

### Exemple de Script pour Automatiser cette Opération

Si vous souhaitez automatiser l'ajout de ces entrées, vous pouvez utiliser un fichier `.reg` ou un script en PowerShell ou en batch.

Voici un exemple de fichier `.reg` pour créer une clé pour votre logiciel :

```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\Software\MonLogiciel]
"Nom"="MonLogiciel"
"Chemin"="C:\\Chemin\\Vers\\MonLogiciel"
"Version"="1.0.0"
```

Enregistrez ce contenu dans un fichier `.reg` et exécutez-le pour ajouter automatiquement ces entrées dans le registre.

### Remarque Importante
- **Soyez prudent** lorsque vous modifiez le registre de Windows, car une mauvaise modification peut entraîner des problèmes système. Assurez-vous de sauvegarder le registre avant de faire des modifications importantes.
- Testez toujours les modifications sur un environnement de test avant de les appliquer sur des systèmes de production.

#####################################################################################################

Pour ajouter une entrée dans le menu contextuel (clic droit) de l'Explorateur de fichiers pour votre logiciel, vous devrez modifier le registre de Windows pour associer votre logiciel à une action spécifique. Cela peut être fait en ajoutant des clés et des valeurs dans les sections du registre qui contrôlent le menu contextuel.

Voici la procédure détaillée pour ajouter une entrée de menu contextuel pour votre logiciel :

### 1. **Définir l'Action**
   Avant de commencer, vous devez déterminer ce que votre logiciel doit faire lorsqu'un utilisateur clique sur l'option dans le menu contextuel. Par exemple, est-ce que votre logiciel doit ouvrir un fichier spécifique, traiter un fichier, ou s'ouvrir simplement sans paramètre ?

### 2. **Ouvrir l'Éditeur de Registre**
   - Appuyez sur `Win + R` pour ouvrir la boîte de dialogue Exécuter.
   - Tapez `regedit` et appuyez sur Entrée pour ouvrir l'Éditeur de Registre.

### 3. **Naviguer vers la Clé de Registre Correspondante**
   Les options du menu contextuel dans l'Explorateur de fichiers sont généralement configurées sous les clés suivantes selon le contexte d'application :
   - **Pour tous les fichiers :**
     - `HKEY_CLASSES_ROOT\*\shell`
   - **Pour les dossiers :**
     - `HKEY_CLASSES_ROOT\Directory\shell`
   - **Pour un type de fichier spécifique (ex. fichiers .txt) :**
     - `HKEY_CLASSES_ROOT\.txt\shell`

   Choisissez la clé qui correspond le mieux à l'usage que vous souhaitez pour votre logiciel.

### 4. **Créer une Clé pour votre Logiciel**
   - Cliquez avec le bouton droit sur la clé `shell` (sous la catégorie correspondante comme `*` ou `Directory`) et sélectionnez `Nouveau` > `Clé`.
   - Donnez à cette clé le nom que vous voulez voir apparaître dans le menu contextuel (par exemple, le nom de votre logiciel).

### 5. **Configurer la Commande**
   Maintenant que vous avez créé une clé pour votre logiciel, vous devez spécifier la commande à exécuter lorsque l'utilisateur sélectionne cette option dans le menu contextuel.
   
   - Sous la clé que vous venez de créer (par exemple, `NomDeMonLogiciel`), créez une nouvelle sous-clé appelée `command`.
   - Double-cliquez sur la valeur `(par défaut)` de la sous-clé `command` et entrez le chemin vers l'exécutable de votre logiciel, suivi des paramètres nécessaires, si applicable. Par exemple :
     ```plaintext
     "C:\Chemin\Vers\MonLogiciel.exe" "%1"
     ```

     Le paramètre `"%1"` représente le fichier ou le dossier sélectionné sur lequel l'utilisateur a cliqué.

### 6. **Facultatif : Ajouter des Icônes ou des Options Avancées**
   Si vous souhaitez ajouter une icône à votre entrée de menu contextuel ou spécifier des options avancées, vous pouvez le faire en ajoutant d'autres valeurs à votre clé.

   - **Ajouter une icône :**
     - Sous votre clé logicielle (`NomDeMonLogiciel`), créez une nouvelle valeur chaîne nommée `Icon`.
     - Définissez cette valeur sur le chemin de l'icône que vous souhaitez utiliser (par exemple, `C:\Chemin\Vers\MonIcone.ico`).

   - **Options supplémentaires (par exemple, exécuter en tant qu'administrateur, etc.) :**
     - Vous pouvez ajouter des sous-clés supplémentaires pour spécifier des options comme `runas` pour exécuter en tant qu'administrateur.

### 7. **Fermer l'Éditeur de Registre**
   Une fois que vous avez ajouté les clés et valeurs nécessaires, vous pouvez fermer l'Éditeur de Registre. Les modifications prennent effet immédiatement ; vous n'avez pas besoin de redémarrer votre ordinateur.

### Exemple de Script .reg pour Automatiser cette Opération

Si vous souhaitez automatiser cette opération, vous pouvez créer un fichier `.reg` avec les commandes suivantes. Voici un exemple pour ajouter une option au menu contextuel pour tous les fichiers :

```reg
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\*\shell\NomDeMonLogiciel]
@="Ouvrir avec MonLogiciel"
"Icon"="C:\\Chemin\\Vers\\MonIcone.ico"

[HKEY_CLASSES_ROOT\*\shell\NomDeMonLogiciel\command]
@="\"C:\\Chemin\\Vers\\MonLogiciel.exe\" \"%1\""
```

Enregistrez ce contenu dans un fichier `.reg`, puis double-cliquez dessus pour ajouter ces entrées dans le registre.

### Remarques Importantes
- **Précautions** : Comme toujours, soyez prudent lors de la modification du registre, car des erreurs peuvent causer des problèmes système. Faites une sauvegarde du registre avant de faire des changements importants.
- **Test** : Testez toujours ces modifications sur un système de test avant de les déployer sur un système de production.

#####################################################################################################

Avec NSIS (Nullsoft Scriptable Install System), vous pouvez facilement ajouter des entrées dans le registre Windows lors de l'installation de votre logiciel. NSIS offre plusieurs fonctions pour manipuler le registre, telles que `WriteRegStr`, `WriteRegDWORD`, `WriteRegBin`, etc.

Voici un guide pour ajouter des entrées dans le registre via votre script NSIS :

### 1. **Ajouter une Entrée Basique dans le Registre**

Supposons que vous vouliez ajouter une clé pour votre logiciel sous `HKEY_LOCAL_MACHINE\Software\MonLogiciel` avec certaines valeurs telles que le nom du logiciel, le chemin d'installation, et la version.

Voici un exemple de code NSIS à insérer dans votre script :

```nsis
Section "Install"

  ; Crée la clé de registre pour le logiciel sous HKEY_LOCAL_MACHINE\Software\MonLogiciel
  WriteRegStr HKLM "Software\MonLogiciel" "Nom" "MonLogiciel"
  WriteRegStr HKLM "Software\MonLogiciel" "Chemin" "$INSTDIR"  ; $INSTDIR est le répertoire d'installation
  WriteRegStr HKLM "Software\MonLogiciel" "Version" "1.0.0"

SectionEnd
```

### 2. **Ajouter une Entrée dans le Menu Contextuel (Clic Droit)**

Supposons que vous vouliez ajouter une option au menu contextuel (clic droit) de l'Explorateur de fichiers pour ouvrir des fichiers avec votre logiciel. Ce script ajoutera l'option pour tous les fichiers.

Voici un exemple pour cela :

```nsis
Section "Install Context Menu"

  ; Crée la clé de registre pour ajouter une entrée au menu contextuel (clic droit)
  WriteRegStr HKCR "*\shell\OuvrirAvecMonLogiciel" "" "Ouvrir avec MonLogiciel"
  WriteRegStr HKCR "*\shell\OuvrirAvecMonLogiciel" "Icon" "$INSTDIR\MonIcone.ico"  ; Ajoute une icône à l'entrée de menu
  WriteRegStr HKCR "*\shell\OuvrirAvecMonLogiciel\command" "" '"$INSTDIR\MonLogiciel.exe" "%1"'

SectionEnd
```

### 3. **Ajouter une Entrée de Démarrage Automatique (Facultatif)**

Si vous souhaitez que votre logiciel démarre automatiquement lorsque Windows démarre, vous pouvez ajouter une entrée dans la clé `Run` du registre :

```nsis
Section "Add to Startup"

  ; Ajoute le logiciel à la liste des programmes qui démarrent avec Windows
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Run" "MonLogiciel" "$INSTDIR\MonLogiciel.exe"

SectionEnd
```

### 4. **Supprimer les Entrées du Registre lors de la Désinstallation**

Il est également important de nettoyer le registre lorsque votre logiciel est désinstallé. Vous pouvez le faire dans la section `Uninstall` de votre script NSIS.

Voici un exemple pour supprimer les entrées que vous avez ajoutées :

```nsis
Section "Uninstall"

  ; Supprime les clés de registre
  DeleteRegKey HKLM "Software\MonLogiciel"
  DeleteRegKey HKCR "*\shell\OuvrirAvecMonLogiciel"
  DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\Run" "MonLogiciel"

SectionEnd
```

### 5. **Exemple Complet d'un Script NSIS**

Voici un exemple complet de script NSIS, qui inclut l'ajout d'entrées dans le registre et la gestion du nettoyage lors de la désinstallation :

```nsis
# Nom du programme
Name "MonLogiciel"

# Répertoire de sortie
OutFile "MonLogicielInstaller.exe"

# Répertoire d'installation par défaut
InstallDir $PROGRAMFILES\MonLogiciel

# Crée les raccourcis du programme dans le menu démarrer
Section "MainSection"

  ; Installe les fichiers
  SetOutPath "$INSTDIR"
  File "MonLogiciel.exe"
  File "MonIcone.ico"

  ; Ajoute des entrées dans le registre
  WriteRegStr HKLM "Software\MonLogiciel" "Nom" "MonLogiciel"
  WriteRegStr HKLM "Software\MonLogiciel" "Chemin" "$INSTDIR"
  WriteRegStr HKLM "Software\MonLogiciel" "Version" "1.0.0"

  ; Ajoute une entrée au menu contextuel (clic droit)
  WriteRegStr HKCR "*\shell\OuvrirAvecMonLogiciel" "" "Ouvrir avec MonLogiciel"
  WriteRegStr HKCR "*\shell\OuvrirAvecMonLogiciel" "Icon" "$INSTDIR\MonIcone.ico"
  WriteRegStr HKCR "*\shell\OuvrirAvecMonLogiciel\command" "" '"$INSTDIR\MonLogiciel.exe" "%1"'

  ; Ajoute une entrée pour démarrer avec Windows
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Run" "MonLogiciel" "$INSTDIR\MonLogiciel.exe"

SectionEnd

Section "Uninstall"

  ; Supprime les fichiers installés
  Delete "$INSTDIR\MonLogiciel.exe"
  Delete "$INSTDIR\MonIcone.ico"

  ; Supprime les entrées de registre
  DeleteRegKey HKLM "Software\MonLogiciel"
  DeleteRegKey HKCR "*\shell\OuvrirAvecMonLogiciel"
  DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\Run" "MonLogiciel"

  ; Supprime le répertoire d'installation
  RMDir "$INSTDIR"

SectionEnd
```

### Explication du Script :

1. **Installation :**
   - Les fichiers sont copiés dans le répertoire d'installation (`$INSTDIR`).
   - Les clés de registre sont créées pour le logiciel sous `HKEY_LOCAL_MACHINE\Software\MonLogiciel`.
   - Une entrée est ajoutée dans le menu contextuel (clic droit) pour ouvrir des fichiers avec le logiciel.
   - Une entrée est ajoutée pour démarrer le logiciel avec Windows.

2. **Désinstallation :**
   - Le script supprime les fichiers, les clés de registre, et le répertoire d'installation lors de la désinstallation.

### Remarques :
- **Privilèges d'administrateur** : Si vous modifiez le registre sous `HKEY_LOCAL_MACHINE`, assurez-vous que votre installateur demande les privilèges d'administrateur en utilisant la directive `RequestExecutionLevel admin`.
- **Compatibilité** : Testez toujours votre script NSIS sur différents systèmes pour vérifier que les clés de registre sont créées correctement et que la désinstallation les supprime bien.

