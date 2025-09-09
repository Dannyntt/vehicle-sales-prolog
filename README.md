# Vehicle-sales
# 🚗 Vehicle Sales Management System (Prolog)

**Course:** ST0244 - Programming Languages  
**Practice II – Prolog**  
**University:** EAFIT  
**Lecturer:** Alexander Narváez Berrío  
**Date:** March 2025  

---

## 📌 Project Description

This project implements a **Vehicle Sales Management System** in **Prolog**.  
It allows a dealership to query and analyze its vehicle inventory based on different criteria such as **brand, type, year, price, and budget**.  

The system uses **Prolog predicates**, `findall/3`, and `bagof/3` to generate structured reports and apply constraints (e.g., maximum budget or inventory limit).

---

## 🎯 Objectives

- Define a vehicle catalog using Prolog facts.  
- Implement filters to query vehicles by **type, brand, and budget**.  
- Generate reports grouping results by brand/type/year.  
- Ensure the inventory total does not exceed predefined limits.  
- Validate the system with **test cases**.  

---

## 🗂️ File Structure

- `vehicles.pl` → Prolog code with catalog, predicates, and test cases.  
- `README.md` → Documentation.  
- `examples/` → Screenshots of queries and results. 

---

## ⚙️ How to Run

### Requirements
- Install [**SWI-Prolog**](https://www.swi-prolog.org/).

### Execution
1. Clone this repository:
   ```bash
   git clone https://github.com/<your-user>/vehicle-sales-prolog.git
   cd vehicle-sales-prolog
