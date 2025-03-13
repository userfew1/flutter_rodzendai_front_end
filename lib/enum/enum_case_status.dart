enum CaseStatus {
  pendingScreening,
  accepted,
  declined,
  awaitingAssignment,
  awaitingProcess,
  followUp,
  inProgress,
  success,
  failure,
  canceled,
  unknown
}
CaseStatus getCaseStatus(String status) {
  switch (status) {
    case "รอคัดกรอง":
      return CaseStatus.pendingScreening;
    case "ได้":
      return CaseStatus.accepted;
    case "ไม่ได้":
      return CaseStatus.declined;
    case "รอมอบหมาย":
      return CaseStatus.awaitingAssignment;
    case "รอดำเนินการ":
      return CaseStatus.awaitingProcess;
    case "ติดตามนัดหมายล่วงหน้า":
      return CaseStatus.followUp;
    case "กำลังดำเนินการ":
      return CaseStatus.inProgress;
    case "สำเร็จ":
      return CaseStatus.success;
    case "ไม่สำเร็จ":
      return CaseStatus.failure;
    case "ยกเลิก":
      return CaseStatus.canceled;
    default:
      return CaseStatus.unknown;
  }
}
