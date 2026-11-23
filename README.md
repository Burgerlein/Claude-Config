# 🤖 claude-config
 
> Meine Claude-Konfiguration und mein Arbeitsablauf, synchron auf allen Workstations.
 
![Status](https://img.shields.io/badge/Status-In%20Aufbau-orange)
![Repo](https://img.shields.io/badge/Repo-privat-lightgrey)
 
Dieses Repo enthält die globale `CLAUDE.md`, Vorlagen für Projekte, eigene Skills und Start-Skripte. Auf jeder Workstation reicht ein `git pull`, dann arbeitet Claude überall nach denselben Regeln.
 
## 📁 Struktur
 
```
claude-config/
├── global/
│   └── CLAUDE.md            # gilt für alle Projekte
├── templates/
│   ├── CLAUDE.dotnet.md     # Vorlage C# / Orchard Core
│   ├── CLAUDE.vue.md        # Vorlage Vue
│   └── scripts/             # Start-Skripte für neue Projekte
├── skills/                  # eigene Skills
├── install.sh               # legt Symlinks an
└── README.md
```
 
Die projektspezifische `CLAUDE.md` liegt im jeweiligen Projekt-Repo. Aus `templates/` kommt nur die Startvorlage.
 
## ⚙️ Grundregeln
 
| Regel | Umsetzung |
|---|---|
| Claude steht nicht als Contributor in Commits | In den Claude-Einstellungen abschalten (Attribution/Co-Authored-By) und in der `CLAUDE.md` festhalten |
| Ausgaben immer kurz | Rückfragen stelle ich selbst |
| Texte nie im Code | Alle Texte kommen in Translation-Files, damit ich Wording schnell ändern kann |
| Multibranch | Ein Branch pro Ticket |
 
## 🎫 Ticket-Workflow
 
Geplante Arbeit wird als Ticket auf dem GitHub-Board des Projekts angelegt. Das Board ist in allen Projekten gleich aufgebaut.
 
### Spalten
 
| Spalte | Bedeutung |
|---|---|
| **Agent-Vorschläge** | Ideen und Auffälligkeiten, die beim Entwickeln entstanden sind |
| **Backlog** | Erfasst, noch nicht durchgeplant |
| **Ready** | Fertig durchgeplant, kann gebaut werden |
| **In Progress** | Wird gerade gebaut |
| **In Review (Agent)** | Agent prüft den eigenen Stand |
| **Agent Done** | Agent ist fertig |
| **Dev Testing** | Ich teste |
| **Done** | Abgeschlossen |
 
Die Namen dürfen später noch angepasst werden, der Ablauf bleibt.
 
### Milestones
 
Jedes Ticket gehört zu einem Milestone. Das hilft beim Release und später bei einer Release-Pipeline, zum Beispiel für Kurvenlevel.
 
### Commits
 
```
(TicketNummer) - Beschreibung
```
 
Beispiel: `(#12) - Rangliste nach Punkten sortieren`
 
### Ausgabe nach jedem fertigen Ticket
 
Immer kurz und als Stichpunkte:
 
1. **Testen:** Was muss ich tun, um es zu testen?
2. **Gebaut:** Was wurde umgesetzt?
3. **Neue Tickets:** Welche Tickets sind entstanden (Agent-Vorschläge)?
4. **Als Nächstes:** Was würde der Agent als Nächstes aus dem Backlog bauen?
## 🚀 Start-Skripte für neue Projekte
 
Jedes neue Projekt bekommt diese Skripte (aus `templates/scripts/`):
 
| Skript | Aufgabe |
|---|---|
| **Start Programm** | App starten |
| **Start Design Board** | Design Board öffnen |
| **Öffne TicketBoard** | GitHub-Board des Projekts im Browser öffnen |
| **Deploy auf Handy** | Nur bei Mobile-App: auf das Smartphone installieren |
 
Beim Deploy gibt es zwei Modi:
 
- **Release-Modus** oder **Dev-Modus**
- jeweils **mit Datenübernahme** oder **ohne**
Die Skripte sollen sich direkt in der Programmleiste auswählen lassen.
 
## 🎨 Design Board
 
Ein Übersichtsboard mit **Screen-Flow**, das alle Screens und Menüs des Projekts abbildet.
 
- Zu Projektbeginn wird gefragt: Alle Screens vorab planen oder jeden Screen beim Bauen eintragen?
- Jeder neue Screen wird im Board ergänzt.
- Das Board gibt neuen Agents mit wenig Tokens einen schnellen Überblick über die App.
- Ziel ist ein **wiederverwendbares Grundgerüst**, das später auch Screen-Animationen zeigen kann.
- Später: Spec zum Bauen der Screens, und das fertige Gerüst kann in den Code übernommen werden.
Die Vorlage kommt aus dem Design Board meines GymTrackers.
 
## 🔧 Installation
 
```bash
git clone https://github.com/Burgerlein/claude-config.git
cd claude-config
./install.sh
```
 
Das Skript legt Symlinks von `~/.claude/` auf die Dateien in `global/` und `skills/` an. Auf einer weiteren Workstation: klonen, `install.sh` ausführen, fertig.
 
## 🔐 Hinweis
 
Das Repo bleibt **privat**. Keine Tokens, Passwörter oder Kundendaten in die Dateien schreiben.
 
## 🗺️ Roadmap
 
- [ ] Globale `CLAUDE.md` schreiben
- [ ] Vorlagen für .NET und Vue
- [ ] Board-Konfiguration als Vorlage festhalten
- [ ] Start-Skripte als Vorlage bauen
- [ ] Design-Board-Gerüst aus dem GymTracker übernehmen
- [ ] `install.sh`
 
