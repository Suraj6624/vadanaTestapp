class CourseModel {
  List<Courses>? courses;

  CourseModel({this.courses});

  CourseModel.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  Course? course;
  Payment? payment;

  Courses({this.course, this.payment});

  Courses.fromJson(Map<String, dynamic> json) {
    course = json['course'] != null
        ? new Course.fromJson(json['course'])
        : null;
    payment = json['payment'] != null
        ? new Payment.fromJson(json['payment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.course != null) {
      data['course'] = this.course!.toJson();
    }
    if (this.payment != null) {
      data['payment'] = this.payment!.toJson();
    }
    return data;
  }
}

class Course {
  int? id;
  String? name;
  String? slug;
  String? status;
  int? price;
  int? offerPrice;
  int? totalEmi;
  String? createdAt;
  String? updatedAt;
  Null? orgId;
  Null? image;
  String? shortDescription;
  Null? description;
  int? userId;
  int? parentsId;
  String? paymentType;

  Course({
    this.id,
    this.name,
    this.slug,
    this.status,
    this.price,
    this.offerPrice,
    this.totalEmi,
    this.createdAt,
    this.updatedAt,
    this.orgId,
    this.image,
    this.shortDescription,
    this.description,
    this.userId,
    this.parentsId,
    this.paymentType,
  });

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    status = json['status'];
    price = json['price'];
    offerPrice = json['offer_price'];
    totalEmi = json['total_emi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orgId = json['org_id'];
    image = json['image'];
    shortDescription = json['short_description'];
    description = json['description'];
    userId = json['user_id'];
    parentsId = json['parents_id'];
    paymentType = json['payment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['price'] = this.price;
    data['offer_price'] = this.offerPrice;
    data['total_emi'] = this.totalEmi;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['org_id'] = this.orgId;
    data['image'] = this.image;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    data['parents_id'] = this.parentsId;
    data['payment_type'] = this.paymentType;
    return data;
  }
}

class Payment {
  int? id;
  int? userId;
  int? courseId;
  int? amount;
  String? remarks;
  Null? officialRemarks;
  String? mode;
  String? paymentDate;
  Null? paymentTime;
  String? createdAt;
  String? updatedAt;
  int? collectedBy;
  Null? orgId;
  String? paymentType;
  int? syncId;

  Payment({
    this.id,
    this.userId,
    this.courseId,
    this.amount,
    this.remarks,
    this.officialRemarks,
    this.mode,
    this.paymentDate,
    this.paymentTime,
    this.createdAt,
    this.updatedAt,
    this.collectedBy,
    this.orgId,
    this.paymentType,
    this.syncId,
  });

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    courseId = json['course_id'];
    amount = json['amount'];
    remarks = json['remarks'];
    officialRemarks = json['official_remarks'];
    mode = json['mode'];
    paymentDate = json['payment_date'];
    paymentTime = json['payment_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    collectedBy = json['collected_by'];
    orgId = json['org_id'];
    paymentType = json['payment_type'];
    syncId = json['sync_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['course_id'] = this.courseId;
    data['amount'] = this.amount;
    data['remarks'] = this.remarks;
    data['official_remarks'] = this.officialRemarks;
    data['mode'] = this.mode;
    data['payment_date'] = this.paymentDate;
    data['payment_time'] = this.paymentTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['collected_by'] = this.collectedBy;
    data['org_id'] = this.orgId;
    data['payment_type'] = this.paymentType;
    data['sync_id'] = this.syncId;
    return data;
  }
}
