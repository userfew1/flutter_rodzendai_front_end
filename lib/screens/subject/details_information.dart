import 'package:flutter/material.dart';
import 'package:flutter_rodzendai_front_end/enum/enum_case_status.dart';
import 'package:flutter_rodzendai_front_end/screens/subject/status/bar_accepted.dart';
import 'package:flutter_rodzendai_front_end/screens/subject/status/bar_canceled.dart';
import 'package:flutter_rodzendai_front_end/screens/subject/status/bar_declined.dart';
import 'package:flutter_rodzendai_front_end/screens/subject/status/bar_failed.dart';
import 'package:flutter_rodzendai_front_end/screens/subject/status/bar_pending_assignment.dart';
import 'package:flutter_rodzendai_front_end/screens/subject/status/bar_pending_process.dart';
import 'package:flutter_rodzendai_front_end/screens/subject/status/bar_pending_screening.dart';
import 'package:flutter_rodzendai_front_end/screens/subject/status/bar_pre_follow_up.dart';
import 'package:flutter_rodzendai_front_end/screens/subject/status/bar_success.dart';
import 'package:flutter_rodzendai_front_end/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class DetailsInformation extends StatefulWidget {
  final String jobNumber;
  final String status;
  final VoidCallback onBackPressed;

  const DetailsInformation({
    super.key,
    required this.jobNumber,
    required this.status,
    required this.onBackPressed,
  });

  @override
  State<DetailsInformation> createState() => _DetailsInformationState();
}

class _DetailsInformationState extends State<DetailsInformation> {
  Map<String, String>? selectedRowData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // เรียกฟังก์ชันเพื่อโหลดข้อมูล
    loadData();
  }

  void loadData() {
    // จำลองการโหลดข้อมูลจาก API หรือแหล่งข้อมูลอื่น ๆ
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        selectedRowData = {
          "sheet_number": "12345",
          "date": "2023-10-01",
          "time": "14:30",
          "nameUser": "John Doe",
          "patientType": "Outpatient",
          "serviceType": "General Checkup",
          "abilityToTravel": "Yes",
          "diagnosis": "None",
          "phoneUser": "123-456-7890",
          "hospital": "General Hospital",
          "nameSurname1": "Jane Doe",
          "patients1": "Patient A",
          "phoneNumber1": "987-654-3210",
          "nameSurname2": "John Smith",
          "patients2": "Patient B",
          "phoneNumber2": "456-789-0123",
          "requestInformation": "Urgent",
          "locationStart": "Home",
          "provinceStart": "Bangkok",
          "districtStart": "Pathum Wan",
          "subdistrictStart": "Lumphini",
          "landmarkStart": "Near BTS",
          "locationEnd": "Hospital",
          "provinceEnd": "Bangkok",
          "districtEnd": "Ratchathewi",
          "subdistrictEnd": "Thung Phaya Thai",
          "img": "https://example.com/image.jpg",
        };
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildTitleRow(),
                        const SizedBox(height: 16),
                        _buildMainContainer(),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildInfoContainer(
                              title: "ข้อมูลนัดหมาย",
                              details: [
                                _buildDetailRow("วันที่และเวลานัดหมาย : ",
                                    "${selectedRowData?['date'] ?? 'ไม่ระบุ'} (${selectedRowData?['time'] ?? 'ไม่ระบุ'})"),
                                _buildDetailRow("ชื่อโรงพยาบาล : ",
                                    selectedRowData?['hospital'] ?? 'ไม่ระบุ'),
                                _buildDetailRow("แนบเอกสารใบนัด : ", "ดูข้อมูล",
                                    underline: true, onPasss: () {}),
                              ],
                            ),
                            const SizedBox(width: 16),
                            _buildInfoContainer(
                              title: "ข้อมูลผู้แจ้ง / ผู้ติดต่อ",
                              details: [
                                _buildDetailRow(
                                    "ชื่อ - นามสกุล : ",
                                    selectedRowData!['nameSurname1'] ??
                                        "ไม่ระบุ"),
                                _buildDetailRow("ความสัมพันธ์ : ",
                                    selectedRowData!['patients1'] ?? "ไม่ระบุ"),
                                _buildDetailRow(
                                    "เบอร์โทรติดต่อ : ",
                                    selectedRowData!['phoneNumber1'] ??
                                        "ไม่ระบุ"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildInfoContainer(
                              title: "ข้อมูลผู้ติดตามลำดับที่ 1",
                              details: [
                                _buildDetailRow(
                                    "ชื่อ - นามสกุล : ",
                                    selectedRowData!['nameSurname1'] ??
                                        "ไม่ระบุ"),
                                _buildDetailRow("ความสัมพันธ์ : ",
                                    selectedRowData!['patients1'] ?? "ไม่ระบุ"),
                                _buildDetailRow(
                                    "เบอร์โทรติดต่อ : ",
                                    selectedRowData!['phoneNumber1'] ??
                                        "ไม่ระบุ"),
                              ],
                            ),
                            const SizedBox(width: 16),
                            _buildInfoContainer(
                              title: "ข้อมูลผู้ติดตามลำดับที่ 2",
                              details: [
                                _buildDetailRow(
                                    "ชื่อ - นามสกุล : ",
                                    selectedRowData!['nameSurname2'] ??
                                        "ไม่ระบุ"),
                                _buildDetailRow("ความสัมพันธ์ : ",
                                    selectedRowData!['patients2'] ?? "ไม่ระบุ"),
                                _buildDetailRow(
                                    "เบอร์โทรติดต่อ : ",
                                    selectedRowData!['phoneNumber2'] ??
                                        "ไม่ระบุ"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _buildLargeContainer(),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
              getStatusWidget(widget.status)
            ],
          );
  }

  Widget getStatusWidget(String status) {
    switch (getCaseStatus(status)) {
      case CaseStatus.pendingScreening:
        return const BarPendingScreening();
      case CaseStatus.accepted:
        return const BarAccepted();
      case CaseStatus.declined:
        return const BarDeclined();
      case CaseStatus.awaitingAssignment:
        return const BarPendingAssignment();
      case CaseStatus.awaitingProcess:
        return const BarPendingProcess();
      case CaseStatus.followUp:
        return const BarPreFollowUp();
      case CaseStatus.inProgress:
        return const Text("กำลังดำเนินการ");
      case CaseStatus.success:
        return const BarSuccess();
      case CaseStatus.failure:
        return const BarFailed();
      case CaseStatus.canceled:
        return const BarCanceled();
      default:
        return const Text("สถานะไม่ทราบ");
    }
  }

  Widget _buildInfoContainer(
      {required String title, required List<Widget> details}) {
    return Container(
      width: 364.5,
      height: 156,
      decoration: BoxDecoration(
        color: ThemeColors().white,
        border: Border.all(
          color: ThemeColors().lightBlue70,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ThemeColors().lightBlue60,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...details,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value,
      {bool underline = false, VoidCallback? onPasss}) {
    return GestureDetector(
      onTap: onPasss,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ThemeColors().lightBlue60,
            ),
          ),
          Expanded(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: underline
                    ? ThemeColors().lightBlue60
                    : ThemeColors().gray30,
                decoration:
                    underline ? TextDecoration.underline : TextDecoration.none,
                decorationThickness: 1.5,
                decorationColor: underline ? ThemeColors().lightBlue60 : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      children: [
        GestureDetector(
          onTap: widget.onBackPressed,
          child: SvgPicture.asset(
            'assets/icons/dropdown.svg',
            height: 32,
            width: 32,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(selectedRowData!['nameUser'] ?? "ไม่ระบุ",
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ThemeColors().lightBlue60,
              )),
        ),
        Row(
          children: [
            Text("วันที่บันทึก : 16/11/2024",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors().gray50,
                )),
            Text("ผู้บันทึก : สุขสันต์ วงค์สว่าง",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors().gray50,
                )),
            Text("เลขที่ : ${widget.jobNumber}",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors().gray50,
                )),
          ],
        ),
        const SizedBox(width: 15),
      ],
    );
  }

  Widget _buildMainContainer() {
    return Container(
      width: 745,
      height: 218,
      decoration: BoxDecoration(
        color: ThemeColors().white,
        border: Border.all(
          color: ThemeColors().lightBlue70,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildProfileRow(),
            const SizedBox(height: 5),
            _buildPatientInfoRow(),
            const SizedBox(height: 8),
            _buildContactInfo(),
            const SizedBox(height: 16),
            _buildIDAndBirthdayRow(),
            const SizedBox(height: 16),
            _buildDivider(),
            const SizedBox(height: 8),
            _buildMedicalInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons_detali/man.svg', height: 24, width: 24),
        Text(
          selectedRowData!['nameUser'] ?? "ไม่ระบุ",
          style: TextStyle(
            color: ThemeColors().gray30,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildPatientInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLabeledText(
          "ประเภทผู้ป่วย : ",
          selectedRowData!['patientType'] ?? "ไม่ระบุ",
        ),
        const SizedBox(width: 24),
        _buildLabeledText(
          "ประเภทการบริการ : ",
          selectedRowData!['serviceType'] ?? "ไม่ระบุ",
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Container(
      width: 319,
      height: 22,
      decoration: BoxDecoration(
        color: ThemeColors().orange60,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildWhiteText(
              selectedRowData!['phoneUser'] ?? "ไม่ระบุ",
            ),
            _buildWhiteText(", ไม่ระบุ"),
          ],
        ),
      ),
    );
  }

  Widget _buildIDAndBirthdayRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIconWithText(
            'assets/icons_detali/id_crad.svg', "1 21 2234 23456 1"),
        const SizedBox(width: 8),
        _buildIconWithText(
            'assets/icons_detali/birthday.svg', "16/11/2000 (24 ปี)"),
        const SizedBox(width: 8),
        _buildUnderlinedIconWithText(
            'assets/icons_detali/birthday.svg', "ดูเอกสารบัตรประชาชน"),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Divider(
        color: ThemeColors().lightBlue70,
        thickness: 1,
      ),
    );
  }

  Widget _buildMedicalInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLabeledText(
            "ความสามารถในการเดินทาง : ",
            selectedRowData!['abilityToTravel'] ?? "ไม่ระบุ",
          ),
          const SizedBox(width: 16),
          _buildLabeledText(
            "การวินิจฉัยโรค : ",
            selectedRowData!['diagnosis'] ?? "ไม่ระบุ",
          ),
        ],
      ),
    );
  }

  Widget _buildLabeledText(String label, String text) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: ThemeColors().lightBlue60,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: ThemeColors().gray30,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildWhiteText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: ThemeColors().white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildIconWithText(String iconPath, String text) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, height: 24, width: 24),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: ThemeColors().gray30,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildUnderlinedIconWithText(String iconPath, String text) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, height: 24, width: 24),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: ThemeColors().lightBlue65,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
            decorationColor: ThemeColors().lightBlue65,
          ),
        ),
      ],
    );
  }

  Widget _buildLargeContainer() {
    return Container(
      width: 745,
      constraints: const BoxConstraints(minHeight: 314),
      decoration: BoxDecoration(
        color: ThemeColors().white,
        border: Border.all(
          color: ThemeColors().lightBlue70,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildInfoBox(title: "จุดรับผู้ป่วย"),
                  const SizedBox(width: 16),
                  _buildInfoBoxEnd(title: "จุดนำส่งผู้ป่วย", hasRemark: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "ข้อมูลการขอใช้รถ",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: ThemeColors().lightBlue60,
          ),
        ),
        Container(
          width: 131,
          height: 30,
          decoration: BoxDecoration(
            color: ThemeColors().orange50,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              selectedRowData?['requestInformation'] ?? 'ไม่ระบุ',
              style: TextStyle(
                color: ThemeColors().white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBox({required String title, bool hasRemark = true}) {
    return Container(
      width: 340.5,
      constraints: const BoxConstraints(minHeight: 236),
      decoration: BoxDecoration(
        color: ThemeColors().green100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ThemeColors().green50,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ThemeColors().green50,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: ThemeColors().green50,
          ),
          const SizedBox(height: 8),
          _buildInfoContent(hasRemark),
        ],
      ),
    );
  }

  Widget _buildInfoContent(bool hasRemark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow(
              "สถานที่ :", selectedRowData!['locationStart'] ?? "ไม่ระบุ"),
          const SizedBox(height: 8),
          _buildRow(
              "จังหวัด :", selectedRowData!['provinceStart'] ?? "ไม่ระบุ"),
          _buildRow("อำเภอ :", selectedRowData!['districtStart'] ?? "ไม่ระบุ"),
          _buildRow(
              "แขวง :", selectedRowData!['subdistrictStart'] ?? "ไม่ระบุ"),
          if (hasRemark)
            Divider(
              thickness: 1,
              color: ThemeColors().green50,
            ),
          if (hasRemark)
            _buildRow(
                "จุดสังเกต :", selectedRowData!['landmarkStart'] ?? "ไม่ระบุ"),
        ],
      ),
    );
  }

  Widget _buildInfoBoxEnd({required String title, bool hasRemark = true}) {
    return Container(
      width: 340.5,
      constraints: const BoxConstraints(minHeight: 236),
      decoration: BoxDecoration(
        color: ThemeColors().green100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ThemeColors().green50,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ThemeColors().green50,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: ThemeColors().green50,
          ),
          const SizedBox(height: 8),
          _buildInfoContentEnd(hasRemark),
        ],
      ),
    );
  }

  Widget _buildInfoContentEnd(bool hasRemark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow("สถานที่ :", selectedRowData!['locationEnd'] ?? "ไม่ระบุ"),
          const SizedBox(height: 8),
          _buildRow("จังหวัด :", selectedRowData!['provinceEnd'] ?? "ไม่ระบุ"),
          _buildRow("อำเภอ :", selectedRowData!['districtEnd'] ?? "ไม่ระบุ"),
          _buildRow("แขวง :", selectedRowData!['subdistrictEnd'] ?? "ไม่ระบุ"),
          if (hasRemark)
            Divider(
              thickness: 1,
              color: ThemeColors().green50,
            ),
        ],
      ),
    );
  }

  Widget _buildRow(String title, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ThemeColors().green50,
            ),
          ),
        ),
        Expanded(
          child: Text(
            content,
            style: TextStyle(color: ThemeColors().gray30),
          ),
        ),
      ],
    );
  }
}
