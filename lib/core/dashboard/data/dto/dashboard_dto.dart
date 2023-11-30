class DashboardDTO {
  final String greeting;
  final String name;
  final String position;
  final int totalEmployees;
  final int currentEmployees;
  final int maleQty;
  final int femaleQty;
  final int activeEmployees;
  final int inactiveEmployees;

  DashboardDTO({
    required this.greeting,
    required this.name,
    required this.position,
    required this.totalEmployees,
    required this.currentEmployees,
    required this.maleQty,
    required this.femaleQty,
    required this.activeEmployees,
    required this.inactiveEmployees,
  });
}
