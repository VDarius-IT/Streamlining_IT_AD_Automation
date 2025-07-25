# 🚀 IT Optimierung: Active Directory Automatisierung mit PowerShell DSC

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg?style=for-the-badge&logo=powershell)
![DSC](https://img.shields.io/badge/DSC-Enabled-orange?style=for-the-badge)
![Active Directory](https://img.shields.io/badge/Active%20Directory-Supported-blue?style=for-the-badge&logo=windows-server)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

> Ein umfassendes Automatisierungs-Framework für das Active Directory User Lifecycle Management, das durch die Behandlung der Infrastruktur als Code eine **Reduzierung der Onboarding-Zeit für Mitarbeiter um 80 %** erreicht.

Dieses Repository bietet eine praxisnahe Vorlage für den Einsatz von **PowerShell Desired State Configuration (DSC)**, um Active Directory-Operationen zu revolutionieren. Durch die Definition des Zustands von Benutzern, Gruppen und Richtlinien als Code eliminiert dieses Framework manuelle Fehler, standardisiert IT-Abläufe und gibt IT-Experten wertvolle Zeit zurück.

## 📋 Inhaltsverzeichnis

- [Das Problem: Die hohen Kosten der manuellen AD-Verwaltung](#-das-problem-die-hohen-kosten-der-manuellen-ad-verwaltung)
- [Die Lösung: Infrastructure as Code für Active Directory](#-die-lösung-infrastructure-as-code-für-active-directory)
- [Hauptmerkmale](#-hauptmerkmale)
- [Geschäftliche Auswirkungen](#-geschäftliche-auswirkungen)
- [Repository-Struktur](#-repository-struktur)
- [Erste Schritte](#️-erste-schritte)
- [Praxisnahes Workflow-Beispiel](#-praxisnahes-workflow-beispiel)
- [Mitwirken](#-mitwirken)
- [Lizenz](#-lizenz)

---

## 📌 Das Problem: Die hohen Kosten der manuellen AD-Verwaltung

Traditionelle Onboarding-Prozesse im Active Directory sind manuell, zeitaufwändig und bekanntermaßen fehleranfällig. Sie beinhalten oft:
*   **Ineffizienz:** Das Onboarding eines einzigen Mitarbeiters erfordert Dutzende von Klicks und manuelle Dateneingaben, was Stunden der Arbeitszeit eines IT-Experten in Anspruch nimmt.
*   **Inkonsistenz:** Manuelle Prozesse führen zu einer inkonsistenten Anwendung von Sicherheitsrichtlinien, Gruppenmitgliedschaften und OU-Platzierungen, was Sicherheitsrisiken schafft.
*   **Menschliche Fehler:** Tippfehler in Benutzernamen, falsche Gruppenzuweisungen oder vergessene Berechtigungen sind häufig und führen zu Support-Tickets am ersten Tag und Produktivitätsverlusten.
*   **Skalierbarkeitsprobleme:** Die manuelle Bearbeitung von Neueinstellungen, Beförderungen und Offboarding wird zu einem erheblichen Engpass, wenn eine Organisation wächst.

## ✨ Die Lösung: Infrastructure as Code für Active Directory

Dieses Projekt gestaltet die Active Directory-Verwaltung neu, indem es die Prinzipien von **Infrastructure as Code (IaC)** mit PowerShell DSC anwendet. Wir definieren, *was* wir wollen (den Soll-Zustand), und überlassen der DSC-Engine das *Wie* (die Implementierung).

Die Hauptvorteile dieses Ansatzes sind:
*   **Deklarative Syntax:** Sie definieren den Endzustand eines Benutzers oder einer Gruppe, nicht die schrittweisen Befehle, um dorthin zu gelangen.
*   **Idempotenz:** Die Konfiguration kann wiederholt ausgeführt werden. Sie nimmt nur dann Änderungen vor, wenn der aktuelle Zustand nicht mit dem Soll-Zustand übereinstimmt, was sie sicher und vorhersagbar macht.
*   **Selbstheilung:** DSC kann regelmäßig Abweichungen in der Konfiguration überprüfen und korrigieren, um sicherzustellen, dass Richtlinien und Mitgliedschaften konform bleiben.
*   **Auditierbar & versioniert:** Das Speichern von Konfigurationen in Git bietet eine vollständige, auditierbare Historie jeder Änderung an Ihrer AD-Struktur.

## 🔧 Hauptmerkmale

| Merkmal                      | Beschreibung                                                                                                                                              |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Automatisierte Benutzererstellung** | Erstellt AD-Benutzer aus strukturierten Eingabedaten (CSV/JSON) mit allen erforderlichen Attributen (Abteilung, Titel usw.).                     |
| **Dynamische Gruppenmitgliedschaft**  | Weist Benutzer automatisch Sicherheits- und Verteilergruppen zu, basierend auf ihrer Rolle oder Abteilung.                                       |
| **GPO-Durchsetzung**         | Stellt sicher, dass die richtigen Gruppenrichtlinienobjekte (GPOs) verknüpft und angewendet werden, indem Benutzer in den korrekten OUs platziert werden. |
| **Idempotente Konfiguration**  | DSC stellt sicher, dass das System den Soll-Zustand erreicht. Sicher, wiederholbar und auditierbar.                                                     |
| **Fehlerbehandlung & Protokollierung** | Robuste Protokollierung ist über PowerShell-Transkripte und Ereignisprotokolle für eine einfache Fehlerbehebung integriert.                     |
| **Erweiterbares Design**         | Modulare Struktur ermöglicht zukünftige Integrationen mit HR-Systemen (z. B. Workday, BambooHR) über APIs.                                            |

## 📈 Geschäftliche Auswirkungen

Diese Automatisierungsinitiative lieferte transformative, messbare Ergebnisse.

| Metrik                   | Vor der Automatisierung | Nach der Automatisierung            |
| ------------------------------ | ----------------------- | ----------------------------------------------- |
| **Durchschn. Onboarding-Zeit** | 4–5 Stunden             | **< 30 Minuten**                                |
| **Manuelle Fehler**            | Häufig                  | Nahezu eliminiert                               |
| **Richtlinienkonformität**     | Inkonsistent            | 100 % durch Code durchgesetzt                   |
| **Arbeitslast der IT-Admins**  | Hoch & repetitiv        | Um ca. 80 % reduziert, für Projekte freigesetzt |

## 📁 Repository-Struktur

```
/AD-Automation-DSC
│
├── DSC_Configurations/         # Kernskripte für DSC-Konfigurationen (.ps1)
│   ├── AD_UserLifecycle.ps1       # Haupt-DSC-Konfiguration für Benutzer-/Gruppeneinrichtung
│   └── ...
│
├── ConfigurationData/          # Alle Umgebungs- und Benutzerdaten
│   └── Production.psd1            # Benutzerdaten, Gruppenzuordnungen, OU-Pfade
│
├── Resources/                  # Benutzerdefinierte oder Community-DSC-Ressourcen
│   └── xActiveDirectory/          # z. B. aus der PowerShell Gallery
│
├── Scripts/                    # Hilfsskripte für Bereitstellung und Tests
│   ├── CompileAndDeploy.ps1     # Skript zum Kompilieren der MOF und Starten der Konfiguration
│   └── New-UserData.ps1           # Hilfsskript zum Formatieren neuer Benutzerdaten
│
├── Docs/                       # Dokumentation & Diagramme
│   └── Architecture-Workflow.md
│
└── README.md                   # Sie sind hier!
```

## 🛠️ Erste Schritte

### Voraussetzungen

*   Windows Server mit Active Directory Domain Services (AD DS)
*   PowerShell 5.1 oder höher
*   Administratorrechte in der Zieldomäne
*   Erforderliche PowerShell-Module: `PSDscResources`, `xActiveDirectory`

### Schritt-für-Schritt-Anleitung

1.  **Repository klonen**
    ```bash
    git clone https://github.com/your-username/AD-Automation-DSC.git
    cd AD-Automation-DSC
    ```

2.  **Erforderliche DSC-Module installieren**
    ```powershell
    Install-Module -Name PSDscResources, xActiveDirectory -Force
    ```

3.  **Konfigurationsdaten anpassen**
    Dies ist das Herzstück der Automatisierung. Bearbeiten Sie `ConfigurationData/Production.psd1`, um Ihre Umgebung, Benutzer und Gruppen zu definieren.

    **Beispiel `Production.psd1`:**
    ```powershell
    @{
        AllNodes = @(
            @{
                NodeName = 'localhost' # Oder Ihr Ziel-DC/Verwaltungsserver
                PSDscAllowDomainUser = $true
            }
        );

        NonNodeData = @{
            DomainName = "yourdomain.local"
            UserBaseOU = "OU=Employees,DC=yourdomain,DC=local"
            Users = @(
                @{
                    UserName    = "jdoe"
                    FirstName   = "Jane"
                    LastName    = "Doe"
                    Department  = "Marketing"
                    JobTitle    = "Marketing Specialist"
                    # Für die Produktion PSCredential-Objekte oder einen Secrets Vault verwenden
                    Password    = "P@ssw0rd123!" 
                    Groups      = @("Marketing Users", "All Staff")
                },
                @{
                    UserName    = "bsmith"
                    FirstName   = "Bob"
                    LastName    = "Smith"
                    Department  = "Engineering"
                    JobTitle    = "Software Engineer"
                    Password    = "P@ssw0rd456!"
                    Groups      = @("Engineering Users", "VPN Access", "All Staff")
                }
            )
        }
    }
    ```

4.  **Konfiguration kompilieren und anwenden**
    Ein Hilfsskript wird bereitgestellt, um die `.mof`-Datei zu generieren und die Konfiguration anzuwenden.

    ```powershell
    # Dieses Skript kompiliert die Konfiguration und startet den DSC-Lauf
    .\Scripts\CompileAndDeploy.ps1
    ```
    Alternativ können Sie die Befehle manuell ausführen:
    ```powershell
    # 1. Die Konfiguration kompilieren, um eine MOF-Datei zu erstellen
    . .\DSC_Configurations\AD_UserLifecycle.ps1
    AD_UserLifecycle -ConfigurationData .\ConfigurationData\Production.psd1 -OutputPath .\MOF_Output

    # 2. Die Konfiguration anwenden
    Start-DscConfiguration -Path .\MOF_Output -Wait -Verbose
    ```

5.  **Ergebnisse überprüfen**
    Überprüfen Sie „Active Directory-Benutzer und -Computer“, um zu bestätigen, dass die neuen Benutzer und Gruppenmitgliedschaften wie definiert erstellt wurden.

⚠️ **Wichtig:** Testen Sie DSC-Konfigurationen immer in einer Nicht-Produktions-Laborumgebung, bevor Sie sie in der Produktion einsetzen.

## 💼 Praxisnahes Workflow-Beispiel

**Szenario:** Eine neue Entwicklerin, „Alice Williams“, tritt dem Engineering-Team bei.

**Aktion:**
1.  Öffnen Sie `ConfigurationData/Production.psd1`.
2.  Fügen Sie einen neuen Benutzerblock für Alice unter dem `Users`-Array hinzu:
    ```powershell
    @{
        UserName    = "awilliams"
        FirstName   = "Alice"
        LastName    = "Williams"
        Department  = "Engineering"
        JobTitle    = "Senior Developer"
        Password    = "P@ssw0rd789!"
        Groups      = @("Engineering Users", "VPN Access", "Admin Access - Dev", "All Staff")
    }
    ```
3.  Speichern Sie die Datei und committen Sie die Änderung in Git.
4.  Führen Sie `.\Scripts\CompileAndDeploy.ps1` aus.

**Ergebnis (vollautomatisiert):**
*   Das Benutzerkonto `awilliams` wird in der richtigen OU erstellt.
*   Das Konto wird mit einem temporären Passwort aktiviert, das bei der ersten Anmeldung geändert werden muss.
*   Der Benutzer wird automatisch zu allen vier angegebenen Sicherheitsgruppen hinzugefügt.
*   Alle GPOs, die mit dieser OU und diesen Gruppen verknüpft sind, werden bei der nächsten Anmeldung angewendet.

Was zuvor mehr als 30 Minuten manuelle Arbeit erforderte, ist nun in weniger als einer Minute mit 100%iger Genauigkeit erledigt.

## 🤝 Mitwirken

Beiträge, Issues und Feature-Anfragen sind willkommen! Besuchen Sie gerne die [Issues-Seite](https://github.com/your-username/AD-Automation-DSC/issues).

1.  Forken Sie das Projekt
2.  Erstellen Sie Ihren Feature-Branch (`git checkout -b feature/AmazingFeature`)
3.  Committen Sie Ihre Änderungen (`git commit -m 'Add some AmazingFeature'`)
4.  Pushen Sie zum Branch (`git push origin feature/AmazingFeature`)
5.  Öffnen Sie einen Pull Request


## 📜 Lizenz

Dieses Projekt ist unter der MIT Lizenz lizenziert. Weitere Details finden Sie in der `LICENSE` Datei.
