
db.solutions.insertOne({
  solution_id: 16,
  details: "Repair drainage system to prevent flooding in central area.",
  cost: 98000,
  issues: [{ issue_id: 4 }, { issue_id: 9 }],
  office: { name: "Public Works Department", contact: "02-123-4567" },
  start_date: ISODate("2025-03-01"),
  finish_date: null,
  feedback: []
});
db.issues.updateMany(
  { issue_id: { $in: [4, 9] } },
  { $addToSet: { solutions: 16 }, $set: { status: "in progress" } }
);

db.solutions.aggregate([
  {
	$addFields: {
  	duration_days: {
    	$cond: {
      	if: { $and: [{ $ne: ["$finish_date", null] }, { $ne: ["$start_date", null] }] },
      	then: { $divide: [{ $subtract: ["$finish_date", "$start_date"] }, 1000 * 60 * 60 * 24] },
      	else: null
    	}
  	}
	}
  },
  { $match: { duration_days: { $ne: null } } },
  {
	$group: {
  	_id: "$office.name",
  	avg_fix_time_days: { $avg: "$duration_days" },
  	total_completed_solutions: { $sum: 1 }
	}
  },
  { $sort: { avg_fix_time_days: 1 } }
]);

([
  {
	$match: { finish_date: { $ne: null } }
  },
  {
	$addFields: {
  	duration_days: {
    	$divide: [
      	{ $subtract: ["$finish_date", "$start_date"] },
      	1000 * 60 * 60 * 24
    	]
  	}
	}
  },
  {
	$group: {
  	_id: {
    	year: { $year: "$finish_date" },
    	month: { $month: "$finish_date" }
  	},
  	closed_solutions: { $sum: 1 },
  	avg_resolution_days: { $avg: "$duration_days" },
  	total_cost: { $sum: "$cost" }
	}
  },
  { $sort: { "_id.year": 1, "_id.month": 1 } }
]);

db.solutions.aggregate([
  { $match: { finish_date: { $ne: null } } },
  {
	$group: {
  	_id: {
    	year: { $year: "$finish_date" },
    	month: { $month: "$finish_date" }
  	},
  	total_cost: { $sum: "$cost" },
  	total_solutions: { $sum: 1 }
	}
  },
  { $sort: { "_id.year": 1, "_id.month": 1 } }
]);

db.solutions.aggregate([
  { $unwind: "$feedback" },
  {
	$group: {
  	_id: "$office.name",
  	avg_rating: { $avg: "$feedback.rating" },
  	total_feedbacks: { $sum: 1 }
	}
  },
  { $sort: { avg_rating: -1 } }
]);

db.issues.aggregate([
  {
    $group: {
      _id: {
        $cond: [
          { $eq: ["$status", "resolved"] },
          "resolved",
          "pending_or_in_progress"
        ]
      },
      count: { $sum: 1 }
    }
  }
]);

{
    $group: {
      _id: "$category",
      total: { $sum: 1 }
    }
  },
  { $sort: { total: -1 } 
  },
  {
    $limit: 1
  }
]);

db.solutions.aggregate([
  {
    $addFields: {
      finishYear: { $year: { $toDate: "$finish_date" } },
      finishMonth: { $month: { $toDate: "$finish_date" } }
    }
  },
  {
    $match: {
      finishYear: new Date().getFullYear(),
      finishMonth: new Date().getMonth() + 1
    }
  },
  {
    $project: {
      _id: 0,
      solution_id: 1,
      finishYear: 1,
      finishMonth: 1
    }
  }
]);

db.solutions.aggregate([
   {
    $addFields: {
      finishYear: { $year: { $toDate: "$finish_date" } },
      finishMonth: { $month: { $toDate: "$finish_date" } }
    }
  },
  {
    $match: {
      finishYear: new Date().getFullYear(),
      finishMonth: new Date().getMonth() + 1
    }
  },
  {
    $group:
    {
      _id: "$office.name",
      total_cost: {$sum: "$cost"},
      total_solution: {$sum: 1}
    }
  }
]);

db.solutions.updateOne(
  { solution_id: 3 },
  {
    $push: {
      feedback: {
        rating: 4,
        review: "The repair was good, but took a bit long.",
        citizen: {
          first_name: "Somjai",
          last_name: "Jairak",
          thai_id: "3948573928475"
        }
      }
    }
  });

db.issues.insertOne({
  issue_id: 2,
  description: "Streetlight not working on Soi 3, causing safety concerns at night.",
  category: "public lighting",
  reported_at: "2025-10-12",
  location: {
    district: "Rangsit",
    street: "Phahon Yothin Road, Soi 3"
  },
  media: [
    { type: "image", url: "streetlight_issue_soi3.jpg" }
  ],
  status: "new",
  citizen: {
    name: "Suthep Petchara",
    contact: "suthep.p@example.com"
  },
  solutions: []
});

const cutoff = new Date();
cutoff.setFullYear(cutoff.getFullYear() - 2);
db.solutions.deleteMany({finish_date: { $lt: cutoff }});

db.solutions.aggregate([  {
    $project: {
      office_name: "$office.name",
      duration_days: {
        $divide: [
          { $subtract: ["$finish_date", "$start_date"] },
          1000 * 60 * 60 * 24 ]}}},
  {
    $group: {
      _id: "$office_name",
      avg_fix_time_days: { $avg: "$duration_days" }
    } },
  {
    $sort: { avg_fix_time_days: 1 }  }]);

db.solutions.find( {
    $or: [
      { finish_date: { $exists: false } },
      { finish_date: null }
    ]},
  {
    _id: 1,
    solution_id: 1,
    "office.name": 1,
    start_date: 1,
    finish_date: 1
  }).limit(5);

db.solutions.find(
  {
    $or: [
      { feedback: { $exists: false } }, { feedback: null },   
      { feedback: {} }, ]  },
  {
    _id: 1,
    solution_id: 1,
    "office.name": 1,
    start_date: 1,
    finish_date: 1,
    feedback: 1
  });

db.issues.deleteOne({ issue_id: 123 });

db.issues.deleteOne({ description: "Duplicate test record" });

db.issues.deleteMany({ status: "incorrect" });

db.issues.updateOne(
{ issue_id: 12},
{
$set: {
status: "in progress",
solutions: 7
}
}
);

db.issues.aggregate([
{
$group: {
_id: "$status",
issues: {
$push: {
issue_id: "$issue_id",
description: "$description",
category: "$category",
reported_at: "$reported_at",
location: "$location",
solution_id: "$solution_id",
citizen: "$citizen"
}
}
}
},
{
$project: {
_id: 0,
status: "$_id",
issues: 1
}
}
]);

db.solutions.aggregate([
  { $unwind: "$feedback" },
  {
    $lookup: {
      from: "issues",
      localField: "feedback.citizen.thai_id",
      foreignField: "citizen.thai_id",
      as: "reported_issues"
    }
  },
  { $match: { "reported_issues": { $size: 0 } } },
  {
    $project: {
      _id: 0,
      citizen: "$feedback.citizen",
      rating: "$feedback.rating",
      review: "$feedback.review"
    }
  }
]);

db.solutions.aggregate([ 
{ 
$unwind: { 
path: "$feedback", 
preserveNullAndEmptyArrays: false 
} 
}, 
{ 
$group: { 
_id: "$office.name", 
avg_rating: { $avg: "$feedback.rating" }, 
total_solutions: { $sum: 1 }, 
contact: { $first: "$office.contact" } 
} 
}, 
{ $sort: { avg_rating: -1 } }, 
{ 
$group: { 
_id: null, 
highest_rated_office: { $first: "$$ROOT" }, 
lowest_rated_office: { $last: "$$ROOT" } 
} 
}, 
{ 
$project: { 
_id: 0, 
highest_rated_office: { 
name: "$highest_rated_office._id", 
contact: "$highest_rated_office.contact", 
avg_rating: "$highest_rated_office.avg_rating", 
total_solutions: "$highest_rated_office.total_solutions" 
}, 
lowest_rated_office: { 
name: "$lowest_rated_office._id", 
contact: "$lowest_rated_office.contact", 
avg_rating: "$lowest_rated_office.avg_rating", 
total_solutions: "$lowest_rated_office.total_solutions" 
} 
} 
} 
]);


