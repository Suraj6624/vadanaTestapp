class UserModel {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? twoFactorConfirmedAt;
  String? currentTeamId;
  String? profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? orgId;
  String? image;
  String? studentId;
  String? stateId;
  String? cityId;
  String? address;
  String? pinCode;
  String? pincode;
  String? type;
  String? phone;
  String? status;
  String? enquiry;
  String? userId;
  String? qualificationId;
  String? about;
  String? courseId;
  String? batchId;
  String? fathersName;
  String? mothersName;
  String? dob;
  String? gender;
  String? bloodGroup;
  String? whatsappNum;
  String? parentsNum;
  String? alternateNum;
  String? emergencyNo;
  String? permanentAdd;
  String? autoStuId;
  String? registrationNo;
  int? religionId;
  String? admissionDate;
  String? occupation;
  String? maritalStatus;
  String? profilePhotoUrl;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.twoFactorConfirmedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    this.createdAt,
    this.updatedAt,
    this.orgId,
    this.image,
    this.studentId,
    this.stateId,
    this.cityId,
    this.address,
    this.pinCode,
    this.pincode,
    this.type,
    this.phone,
    this.status,
    this.enquiry,
    this.userId,
    this.qualificationId,
    this.about,
    this.courseId,
    this.batchId,
    this.fathersName,
    this.mothersName,
    this.dob,
    this.gender,
    this.bloodGroup,
    this.whatsappNum,
    this.parentsNum,
    this.alternateNum,
    this.emergencyNo,
    this.permanentAdd,
    this.autoStuId,
    this.registrationNo,
    this.religionId,
    this.admissionDate,
    this.occupation,
    this.maritalStatus,
    this.profilePhotoUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orgId = json['org_id'];
    image = json['image'];
    studentId = json['student_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    address = json['address'];
    pinCode = json['pin_code'];
    pincode = json['pincode'];
    type = json['type'];
    phone = json['phone'];
    status = json['status'];
    enquiry = json['enquiry'];
    userId = json['user_id'];
    qualificationId = json['qualification_id'];
    about = json['about'];
    courseId = json['course_id'];
    batchId = json['batch_id'];
    fathersName = json['fathers_name'];
    mothersName = json['mothers_name'];
    dob = json['dob'];
    gender = json['gender'];
    bloodGroup = json['blood_group'];
    whatsappNum = json['whatsapp_num'];
    parentsNum = json['parents_num'];
    alternateNum = json['alternate_num'];
    emergencyNo = json['emergency_no'];
    permanentAdd = json['permanent_add'];
    autoStuId = json['auto_stu_id'];
    registrationNo = json['registration_no'];
    religionId = json['religion_id'];
    admissionDate = json['admission_date'];
    occupation = json['occupation'];
    maritalStatus = json['marital_status'];
    profilePhotoUrl = json['profile_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_confirmed_at'] = this.twoFactorConfirmedAt;
    data['current_team_id'] = this.currentTeamId;
    data['profile_photo_path'] = this.profilePhotoPath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['org_id'] = this.orgId;
    data['image'] = this.image;
    data['student_id'] = this.studentId;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['address'] = this.address;
    data['pin_code'] = this.pinCode;
    data['pincode'] = this.pincode;
    data['type'] = this.type;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['enquiry'] = this.enquiry;
    data['user_id'] = this.userId;
    data['qualification_id'] = this.qualificationId;
    data['about'] = this.about;
    data['course_id'] = this.courseId;
    data['batch_id'] = this.batchId;
    data['fathers_name'] = this.fathersName;
    data['mothers_name'] = this.mothersName;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['blood_group'] = this.bloodGroup;
    data['whatsapp_num'] = this.whatsappNum;
    data['parents_num'] = this.parentsNum;
    data['alternate_num'] = this.alternateNum;
    data['emergency_no'] = this.emergencyNo;
    data['permanent_add'] = this.permanentAdd;
    data['auto_stu_id'] = this.autoStuId;
    data['registration_no'] = this.registrationNo;
    data['religion_id'] = this.religionId;
    data['admission_date'] = this.admissionDate;
    data['occupation'] = this.occupation;
    data['marital_status'] = this.maritalStatus;
    data['profile_photo_url'] = this.profilePhotoUrl;
    return data;
  }
}
