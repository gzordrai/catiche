#import "@preview/ulille:0.1.0": report

#show: report.with(
  title: "Titre du rapport",
  author: (
    name: "Prénom Nom",
    formation: "Master Génie Logiciel",
    year: "2024 - 2026",
    mail: "prenom.nom.etu@univ-lille.fr",
  ),
  supervisors: (
    (
      name: "Prénom Nom",
      role: "Maître de conférences",
      company: "Inria",
      mail: "prenom.nom@univ-lille.fr",
    ),
  ),
  lang: "fr",
)

= Introduction

= Conclusion
