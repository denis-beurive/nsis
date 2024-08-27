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


#####################################################################################################

Ajouter une application au menu "Démarrer" de Windows à l'aide de NSIS (Nullsoft Scriptable Install System) est une tâche courante lors de la création d'un installeur. NSIS vous permet de créer des raccourcis dans différents emplacements, y compris le menu "Démarrer".

Voici les étapes et un exemple de script NSIS pour ajouter votre application au menu "Démarrer" :

### Étapes de base :

1. **Définir les répertoires** : Vous devez définir le répertoire d'installation de votre application ainsi que le répertoire où vous allez créer le raccourci dans le menu "Démarrer".
2. **Créer un raccourci** : Utilisez la commande `CreateShortCut` de NSIS pour créer un raccourci vers votre application.
3. **Ajouter une option pour désinstaller** : Il est aussi recommandé d'ajouter une option de désinstallation dans le même menu "Démarrer".

### Exemple de script NSIS

Voici un exemple de script qui montre comment installer une application, créer un raccourci dans le menu "Démarrer" et ajouter une option de désinstallation :

```nsis
# Nom de l'installeur
OutFile "MonApplicationInstaller.exe"

# Nom de l'application et répertoire d'installation
Name "MonApplication"
InstallDir "$PROGRAMFILES\MonApplication"

# Section principale d'installation
Section "Installer"

  # Créer le répertoire d'installation
  CreateDirectory "$INSTDIR"

  # Copier les fichiers de l'application
  SetOutPath "$INSTDIR"
  File "MonApplication.exe"

  # Créer le répertoire du menu Démarrer
  CreateDirectory "$SMPROGRAMS\MonApplication"

  # Créer un raccourci vers l'application dans le menu Démarrer
  CreateShortCut "$SMPROGRAMS\MonApplication\MonApplication.lnk" "$INSTDIR\MonApplication.exe"

  # Ajouter un raccourci pour désinstaller l'application
  CreateShortCut "$SMPROGRAMS\MonApplication\Désinstaller MonApplication.lnk" "$INSTDIR\Uninstall.exe"

SectionEnd

# Section de désinstallation
Section "Uninstall"

  # Supprimer les fichiers d'application
  Delete "$INSTDIR\MonApplication.exe"

  # Supprimer les raccourcis du menu Démarrer
  Delete "$SMPROGRAMS\MonApplication\MonApplication.lnk"
  Delete "$SMPROGRAMS\MonApplication\Désinstaller MonApplication.lnk"

  # Supprimer le répertoire du menu Démarrer
  RMDir "$SMPROGRAMS\MonApplication"

  # Supprimer le répertoire d'installation
  RMDir "$INSTDIR"

SectionEnd

# Créer un fichier de désinstallation
WriteUninstaller "$INSTDIR\Uninstall.exe"
```

### Explication du script :

1. **OutFile "MonApplicationInstaller.exe"** : Spécifie le nom de l'installeur généré.
2. **InstallDir "$PROGRAMFILES\MonApplication"** : Définit le répertoire d'installation par défaut sous `C:\Program Files`.
3. **Section "Installer"** : La section principale d'installation :
   - Crée le répertoire d'installation (`CreateDirectory`).
   - Copie les fichiers de l'application (`File`).
   - Crée le répertoire dans le menu "Démarrer" (`CreateDirectory`).
   - Crée un raccourci pour l'application dans ce répertoire (`CreateShortCut`).
4. **Section "Uninstall"** : La section de désinstallation :
   - Supprime les fichiers de l'application et les raccourcis créés.
   - Supprime les répertoires du menu "Démarrer" et du répertoire d'installation.
5. **WriteUninstaller "$INSTDIR\Uninstall.exe"** : Crée un fichier de désinstallation qui pourra être lancé pour désinstaller l'application.

### Variables utilisées :

- `$INSTDIR` : Représente le répertoire d'installation de l'application.
- `$SMPROGRAMS` : Représente le répertoire du menu "Démarrer" pour l'utilisateur actuel.

### Personnalisation :
- Remplacez `"MonApplication.exe"` par le nom de votre fichier exécutable.
- Vous pouvez ajouter plus de fichiers à copier si votre application en a besoin.
- Vous pouvez également ajouter des conditions ou des options supplémentaires (comme des icônes personnalisées pour les raccourcis).

En utilisant ce script, votre application apparaîtra dans le menu "Démarrer" avec un raccourci vers l'exécutable principal, ainsi qu'une option pour désinstaller l'application.

#####################################################################################################

Oui, il est tout à fait possible d'ajouter votre application à la liste des applications installées dans le Panneau de configuration de Windows (et également accessible via les paramètres "Applications et fonctionnalités"). Pour ce faire, vous devez ajouter certaines informations dans le registre de Windows via votre script NSIS. C'est ce qui permet à Windows de reconnaître votre application comme étant installée, et d'afficher une option pour la désinstaller via le Panneau de configuration.

Voici les étapes générales et un exemple de script NSIS pour enregistrer votre application dans la liste des applications installées :

### Étapes à suivre :

1. **Écrire dans le Registre** : Vous devez ajouter une clé dans le registre Windows sous `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall` (ou `HKEY_CURRENT_USER` pour une installation par utilisateur) avec les informations pertinentes sur votre application.
2. **Inclure le chemin de désinstallation** : Vous devez fournir un chemin vers le fichier de désinstallation (créé lors de l'installation).
3. **Fournir des détails comme la taille de l'installation, la version de l'application, etc.** : Ce sont des détails supplémentaires qui apparaîtront dans la liste des applications installées.

### Exemple de script NSIS

Voici un exemple de script NSIS qui montre comment enregistrer une application dans la liste des programmes installés de Windows :

```nsis
# Nom de l'installeur
OutFile "MonApplicationInstaller.exe"

# Nom de l'application et répertoire d'installation
Name "MonApplication"
InstallDir "$PROGRAMFILES\MonApplication"

# Section principale d'installation
Section "Installer"

  # Créer le répertoire d'installation
  CreateDirectory "$INSTDIR"

  # Copier les fichiers de l'application
  SetOutPath "$INSTDIR"
  File "MonApplication.exe"

  # Créer un raccourci dans le menu Démarrer
  CreateDirectory "$SMPROGRAMS\MonApplication"
  CreateShortCut "$SMPROGRAMS\MonApplication\MonApplication.lnk" "$INSTDIR\MonApplication.exe"
  CreateShortCut "$SMPROGRAMS\MonApplication\Désinstaller MonApplication.lnk" "$INSTDIR\Uninstall.exe"

  # Créer le fichier de désinstallation
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  # Ajouter l'application à la liste des applications installées
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MonApplication" "DisplayName" "MonApplication"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MonApplication" "UninstallString" "$INSTDIR\Uninstall.exe"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MonApplication" "InstallLocation" "$INSTDIR"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MonApplication" "DisplayIcon" "$INSTDIR\MonApplication.exe"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MonApplication" "Publisher" "Nom de l'Éditeur"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MonApplication" "DisplayVersion" "1.0.0"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MonApplication" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MonApplication" "NoRepair" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MonApplication" "EstimatedSize" 20480 ; Taille approximative en Ko

SectionEnd

# Section de désinstallation
Section "Uninstall"

  # Supprimer les fichiers d'application
  Delete "$INSTDIR\MonApplication.exe"
  Delete "$INSTDIR\Uninstall.exe"

  # Supprimer les raccourcis du menu Démarrer
  Delete "$SMPROGRAMS\MonApplication\MonApplication.lnk"
  Delete "$SMPROGRAMS\MonApplication\Désinstaller MonApplication.lnk"
  RMDir "$SMPROGRAMS\MonApplication"

  # Supprimer l'entrée du registre
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MonApplication"

  # Supprimer le répertoire d'installation
  RMDir "$INSTDIR"

SectionEnd
```

### Explication des éléments spécifiques :

1. **Clé de Registre :**
   - `WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MonApplication"` : Cette commande ajoute une nouvelle clé dans le registre sous `HKEY_LOCAL_MACHINE` dans le chemin des applications installées.
   - `"DisplayName"` : Le nom de l'application tel qu'il apparaîtra dans la liste des programmes installés.
   - `"UninstallString"` : Chemin du fichier de désinstallation (qui sera appelé lorsqu'on choisit de désinstaller l'application via le Panneau de configuration).
   - `"InstallLocation"` : Répertoire d'installation de l'application.
   - `"DisplayIcon"` : Icône associée à l'application dans la liste.
   - `"Publisher"` : Le nom de l'éditeur.
   - `"DisplayVersion"` : La version de l'application.
   - `"NoModify"` et `"NoRepair"` : Empêche l'utilisateur de modifier ou réparer l'installation depuis le Panneau de configuration (optionnel).
   - `"EstimatedSize"` : Taille approximative de l'installation en Ko (optionnel).

2. **Désinstallation :**
   - Lors de la désinstallation, vous devez également supprimer l'entrée du registre avec `DeleteRegKey`.

3. **Permissions :**
   - Le script ci-dessus écrit dans `HKLM` (HKEY_LOCAL_MACHINE), ce qui nécessite des privilèges administratifs pour l'installation. Si vous voulez permettre une installation par utilisateur, vous pouvez écrire dans `HKCU` (HKEY_CURRENT_USER) à la place.

### Remarques supplémentaires :

- **Privilèges administratifs** : Si vous écrivez dans `HKLM`, assurez-vous que l'installeur est exécuté avec des privilèges administratifs (`RequestExecutionLevel admin`).
- **Compatibilité avec les versions de Windows** : Ce script est compatible avec les versions modernes de Windows (Windows 7, 8, 10, 11). Les entrées dans le registre sont essentielles pour apparaître dans "Applications et fonctionnalités" et dans le Panneau de configuration.

En suivant ces étapes, votre application apparaîtra correctement dans la liste des applications installées de Windows, avec la possibilité de la désinstaller directement via cette interface.

#####################################################################################################

Oui, il est possible d'ajouter un item dans le menu contextuel de l'explorateur de fichiers de Windows via un script NSIS. Cela se fait en modifiant le registre de Windows pour ajouter un menu contextuel spécifique à votre application. Vous pouvez également créer un sous-menu qui propose des actions supplémentaires.

### Étapes pour y parvenir :

1. **Ajouter un item dans le menu contextuel** : Vous devez ajouter des entrées dans le registre Windows sous la clé correspondante aux fichiers ou types de fichiers sur lesquels vous voulez que le menu contextuel apparaisse.
2. **Créer un sous-menu** : Vous pouvez définir des sous-commandes qui apparaîtront comme un sous-menu lorsque l'utilisateur passe sa souris sur votre entrée dans le menu contextuel.

### Exemple de script NSIS

Voici un exemple de script NSIS qui ajoute un item au menu contextuel pour tous les fichiers et qui ouvre un sous-menu avec deux actions supplémentaires :

```nsis
# Nom de l'installeur
OutFile "MonApplicationInstaller.exe"

# Nom de l'application et répertoire d'installation
Name "MonApplication"
InstallDir "$PROGRAMFILES\MonApplication"

# Section principale d'installation
Section "Installer"

  # Créer le répertoire d'installation
  CreateDirectory "$INSTDIR"

  # Copier les fichiers de l'application
  SetOutPath "$INSTDIR"
  File "MonApplication.exe"

  # Créer un fichier de désinstallation
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  # Ajouter une entrée dans le menu contextuel pour tous les fichiers (*)
  WriteRegStr HKCR "*" "shell\MonApplication" "" "Ouvrir avec MonApplication"
  WriteRegStr HKCR "*" "shell\MonApplication" "Icon" "$INSTDIR\MonApplication.exe"
  
  # Ajouter un sous-menu avec des actions supplémentaires
  WriteRegStr HKCR "*" "shell\MonApplication\SubCommands" "" "Action1;Action2"

  # Action 1
  WriteRegStr HKCR "Software\Classes\MonApplication.Action1" "" "Action 1"
  WriteRegStr HKCR "Software\Classes\MonApplication.Action1\command" "" '"$INSTDIR\MonApplication.exe" /action1'

  # Action 2
  WriteRegStr HKCR "Software\Classes\MonApplication.Action2" "" "Action 2"
  WriteRegStr HKCR "Software\Classes\MonApplication.Action2\command" "" '"$INSTDIR\MonApplication.exe" /action2'

SectionEnd

# Section de désinstallation
Section "Uninstall"

  # Supprimer les fichiers d'application
  Delete "$INSTDIR\MonApplication.exe"
  Delete "$INSTDIR\Uninstall.exe"

  # Supprimer les entrées de menu contextuel dans le registre
  DeleteRegKey HKCR "*" "shell\MonApplication"
  DeleteRegKey HKCR "Software\Classes\MonApplication.Action1"
  DeleteRegKey HKCR "Software\Classes\MonApplication.Action2"

  # Supprimer le répertoire d'installation
  RMDir "$INSTDIR"

SectionEnd
```

### Explication du script :

1. **Menu contextuel principal :**
   - `WriteRegStr HKCR "*" "shell\MonApplication" "" "Ouvrir avec MonApplication"` : Cette commande ajoute un item "Ouvrir avec MonApplication" au menu contextuel pour tous les fichiers (`*`).
   - `WriteRegStr HKCR "*" "shell\MonApplication" "Icon" "$INSTDIR\MonApplication.exe"` : Cette commande associe une icône au menu contextuel de votre application.

2. **Sous-menu :**
   - `WriteRegStr HKCR "*" "shell\MonApplication\SubCommands" "" "Action1;Action2"` : Cela crée un sous-menu avec deux actions, `Action1` et `Action2`.
   - Les actions sont définies séparément sous `Software\Classes\MonApplication.Action1` et `Software\Classes\MonApplication.Action2`, et chacune est associée à une commande spécifique (`"$INSTDIR\MonApplication.exe" /action1` et `"$INSTDIR\MonApplication.exe" /action2`).

3. **Désinstallation :**
   - La section de désinstallation supprime les entrées du registre pour restaurer l'état initial du système, en supprimant les clés que vous avez créées pour le menu contextuel.

### Remarques importantes :

1. **Clés de registre HKCR** : La clé `HKCR` (HKEY_CLASSES_ROOT) est utilisée pour gérer les associations de fichiers et les menus contextuels dans Windows. Cependant, elle combine les informations de `HKEY_LOCAL_MACHINE` et `HKEY_CURRENT_USER`. Si vous souhaitez que les modifications soient spécifiques à l'utilisateur, vous pouvez écrire directement dans `HKEY_CURRENT_USER\Software\Classes`.

2. **Permissions administratives** : Modifier `HKCR` ou `HKEY_LOCAL_MACHINE` nécessite souvent des privilèges administratifs. Assurez-vous que l'installeur est exécuté avec des droits suffisants.

3. **Types de fichiers spécifiques** : Si vous voulez que votre menu contextuel s'applique uniquement à certains types de fichiers, remplacez `"*"` par l'extension de fichier ou le type de fichier correspondant. Par exemple, pour les fichiers `.txt`, utilisez `HKCR "txtfile"`.

4. **Sous-menus complexes** : Windows utilise une structure spécifique pour gérer les sous-menus dans le menu contextuel. Les sous-commandes permettent de définir plusieurs actions sous un même item parent.

En suivant ce script, vous pouvez ajouter un item dans le menu contextuel qui déclenche un sous-menu proposant plusieurs actions. Cela permet d'étendre les fonctionnalités de votre application directement depuis l'explorateur de fichiers de Windows.

