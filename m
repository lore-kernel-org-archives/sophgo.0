Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011028.outbound.protection.outlook.com [52.103.68.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115D01F4617
	for <sophgo@lists.linux.dev>; Mon, 29 Sep 2025 06:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128549; cv=fail; b=oant3+a1yZQu6b+Cx8Y9wZuH226UfgLwEDgEA4TL2us0ilM3s7vy7iWjwDoFwe885fFwUxZz8j6aWs3g95KsIQdFQasSX5TjD6VR4VezvQAiz9KriG8WfQ6Ai3FCttb9wCKiAktVyL6G1zgNxKmWpQEy2HwU8JfQHgMjQpluvhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128549; c=relaxed/simple;
	bh=gr8yrX/VlCJWHTty5Zy1V7D35OUKMCNTijvxCC5QQmE=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=Cp7JRRXAhsuF/KVUJhLT7Eh4BCtir7UY0heccmUx3CLC8xljcg3Fnh98nsIGStK7lMWzTsSdd+O82QnIvNP1uJPMiY6b3tpCO5Zteq2LhY51iuO/Mud6uKdqQ1hRFlG6Cyvwc18On9F4HXSIKTghqq6wC7FA4aiKIwzPCaz++WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WnXM4MSi; arc=fail smtp.client-ip=52.103.68.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="WnXM4MSi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hv99whsRwJ+b/cG19S7Hb76YRXqrNEodiNPhv1b5SBWMZbPh6I/jft0qYcePTC66OpmPb63F+CN3pVF8H6pjvkfjr9V325ybK7CZOzRTeFoz6Gwom7pg4js6IR5t0zfjAvrPSxDRkTf/j/Fa/MDRnMsgSFkxIeC1AkSycDEOk+QCzeUCAvTrQoxMfT16pS8CUTBzHBjCmt+YtpYKuw8/qNlRYOtE+L4ofTCMAsjBYFX815mn3Q6INtTBByurbz76DKA/84kEjp3sjqzA1DzKR01mrzIvuMD88XRidTL5Duwk94TF1zrz4ehtdRJFHsM99W3JKNGVuWV8pRkxoUHhfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdhxJpM58X6tmro0fWYg1SdyJEaiaDOaJGmlyPDAFxU=;
 b=POfeJOKPz22j6iLiDanit5wbVLhjkV7MhuoIeAUDqxHH4SPovq7z93c2hnKICw6/iq+i1+gygMqefnz4thYHpnVRFHLipYpGdKQeALQuo5SNOL/O/dKygpnfThzzPVFiZhSOgChSGhx57Faa53xX5hfhFBXMfeyD8vDc7t0vY6A4RqJSJNHdXR2i+ZbTHUmTmzdVsJ1TsywWolNvdHXhRS5qDZbFKr/uABDV7xsKjeC64CFRwiRygWG+xBXqySiDvBY/v2dgdIMFMEaOwlbg2WP8asT2J3NQsuhvZd4UaM0FLDA+Aqki9owkGBus0aywE3vRMUIDoTAl0NdyzlrplA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdhxJpM58X6tmro0fWYg1SdyJEaiaDOaJGmlyPDAFxU=;
 b=WnXM4MSi6/6VLr7nF97YISNG6XwM8zQ5f9aMDe+NgB9JJAJS0ieRNysD9vKMyDw5eDE5dzpMQAaVUxc3Vl8PJ1vs1qBTmJaCWbo3SKm2go4ZZfGxA9rFwQNefgJxtWlSICS1d+tZgvfFL0RkMvprzsBhcDN9p91WCLcyl4+5FgfY+P3KBBlL4q5lMzf7GTnl0nrTDeTmxrL++UwNFZ91p6H8MRZIMvL8SRVMQwategr8zVjZ6S38oIGq7cXy3DeTkG8BTBw/9X26dVCa0RrfopdpyKOTUdDPw1W+eprKF5WA9jUnzLRl6CNqd1ypJW5DM+xQ7H/a9Lqtto41fbY0eQ==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PNYPR01MB11458.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2cc::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 06:49:03 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%5]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 06:49:03 +0000
Message-ID:
 <MAUPR01MB1107215105C1464149581E4E5FE1BA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 29 Sep 2025 14:49:00 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Sep/29/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::30) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <faf75fb9-567c-4392-b1fa-f66a4bee4c93@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PNYPR01MB11458:EE_
X-MS-Office365-Filtering-Correlation-Id: a54fa861-f056-413d-1b16-08ddff244709
X-MS-Exchange-SLBlob-MailProps:
	VTa9p188PRPVIMsc+eu/1kUrdUAKr9tzFv8Y40/KgHv8Jmlr+ESLtEKu55mgd71tDiJwkl7WRKK5nFDnXl8xIzqoAneEoDdwUHrmllQ900QXEsUe/kKGZ5kYNGAlSf0K05XuuC39DHd8j2lZ0GJh93bYzD1l8cokcOeBQH/w5yQ3P/qZAqEekZV0wCBKcUxyQelJaptFwr+efUZK5OpZL6O/+RyAhqFnPvVqQXzU2t0ORfH8inE/t4Su2v+o1ey9B+Z1W6TwNv+Rp6fwvSQ3nnVnlpX/Y+Mm7UQseE6YkQkF3JJn56PQECVuwaplv4mWzqKdn+Rlp9yhWXRSB8A1EZe2X+5oqPuRNHhV43xWXQ+72RsdQfqEkiDCNb4QnfuUqa+a8sf68OOpME6McSogT/FgVTJQJ+8LXn7WVu4baNo2u6NCTIA4T40Qj//91Oaa2iER+iiTf2R9/vsfJdb312L3ZCk01+Xc+ci5pDhSUDp+k2eyyUK3WzHsWiZIla3urKRxvQXRrbfgrBeqO9Gqe1IxDQbcE+EOvhxdsKU/kqnNRWWYyz+Z9rSaqZdY533odQj00/Qne7Vt8q/JxFV4OUKdmXgo2NdjxFY132I2IsrZsKSVXqYiot6qsJFWIV9M
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|23021999003|19110799012|22402599018|5072599009|15080799012|461199028|6090799003|1602099012|51005399003|39105399003|40105399003|440099028|3412199025|4302099013|13041999003|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmtERHdHUXZRYzNsbGhrSGY2MngvQ1liOUx3RHVUek5TWThGMFovVW1MY1lw?=
 =?utf-8?B?cnJtUVNrUm9qMTlPazRlRTZwcHdUU0loeTNGcmZTUUZHMldWUFQ3NkhIRTNv?=
 =?utf-8?B?TG9nTGpCWTBlRGVtZUt6eXl0d0lxTVNITmpYV3dQaklqcDhMZ3AwQnEvYXll?=
 =?utf-8?B?TlpFOWgyQzFJeHNSQytQWG9MditFQmhNVzZSMVdIRThhWGdwb0U1Q3gyYkpv?=
 =?utf-8?B?cGh1SldaZ2JGczFBNmlpc0lOQ2h3NlNidkdnRDR0cldzbUZsMDg4ZkFTOFcr?=
 =?utf-8?B?dVQyV0pEa09NUWVvYkpYSDJlMTBMenZJaXNzWXgrY1g5VlAyWXJYblhPbmN4?=
 =?utf-8?B?UDJmc2lMNTlQL1FrKy8vWXdncC9lN2dheFpPVW5sZG9hbkg5MHI5dkNTcG1j?=
 =?utf-8?B?aHIyZHY3Q2pTZ1U2ZkpveW5lSWZvTHlGTExsczMzWWtHdGhlQ0F0NVFXTi94?=
 =?utf-8?B?RGdNaXpvL2FlWXoyaTQwOFN0N0tEb25iZzlRdVNGRHh5VUpMamlzN3VxL0tX?=
 =?utf-8?B?Z2MxU3krR242RFBzU08zdDkxN2V3dGptNTNGZFFpTFNlV1M3U1FWenBBcEEz?=
 =?utf-8?B?TlFlWnQ1a3NKRXBHbWVYdWY2eWFaUmlvZHZxc1ZPZUhOdHlydTVBb0ZkakRy?=
 =?utf-8?B?SGFWSm82YWlKdnZ3c25iMjE1SC9HY1VsRVNmNjZlWkpaa0t3RFdRbmhMYmtH?=
 =?utf-8?B?WG53eW9NZEFDdllOdTEvelNJNFNVaDYxK0JnNUhsL00zYVRyT2RFOVZ4ZHBJ?=
 =?utf-8?B?emVhNEg2ZUkwQmV5U1A1TitmK0QvdDEzMEVzN09IS09NSVh2bEJEbTBUY2Vs?=
 =?utf-8?B?cDE0S3NBaHgwYi91Y0VCUXlrMGFGaWNleldZa24yVTFQbkNoLysxMUFrWjlC?=
 =?utf-8?B?cXlyVzVnUG0wMGV4dGxjRTl0UmhBem80ZjlVQ090bEl4WG5XeFJWNVlZOGxl?=
 =?utf-8?B?dEhvUkNadDBmOUFGeUhsZE5PMVF2VjBvbUpwNjN0cmtRaTFEOCt6MVpsTlVT?=
 =?utf-8?B?VWc2WklaWG1ZWjlqYTJjZmNMMCtWRmNzeG12WHZoOFRhTndib0VNSldGU1l4?=
 =?utf-8?B?eUtaUGNWTUtiVHY1RFlkV3BET1JrV3BmeVFpL1QrMjA3Y2ZnUERmTFNDeHNw?=
 =?utf-8?B?SmJqSUZ0eHpNY2NadFkxVEh2U1NtMkthdU1vc3hhbXFqWmFWN2VDUlMwN2hz?=
 =?utf-8?B?Tk1aN1lwaHVWbHRxLzNYcElpQmJMVEhuVk9KUk5PVkY1VDgwRWRSQ0QrNXZD?=
 =?utf-8?B?ODJtSWFIdml5ekdvbTQwbnBKSEJDbU13ckZGeHNjclRYREdwT1hBY25FQk9t?=
 =?utf-8?B?WTliWWhEbWp2TC9vWkRjbkwyM2lrNmo3SVBxeFl4Q1RmZXYxT3M1aWUwV3VD?=
 =?utf-8?B?OVAzbGFJV2dZOS9tcFN6NW5wT3JSZFU1T3JqbGU5Mm00R20xRFlnRnp2VFV1?=
 =?utf-8?B?MnBralJUVGpFeEhQS3crcEttZ1pDL1dmemJwMHp0RVRsV1RvQ1UvVDFJcEVw?=
 =?utf-8?B?ZmZoZFlVUUwwSFdYZjFGN0JXRmtCQU1OeVVIckpqVThwZ3BPQ05VaW1HR3p2?=
 =?utf-8?B?OCtKSkFLeWJVb0hBVVpYdFlWcWh1ckQ0b2JkQVNqOUVKR0pYbDBsZC9oQzB0?=
 =?utf-8?B?WWg0L3dmRDk4bTRWd3NVU3kxaXF1VlplYnVOOVpYZTZVNm1UYnpSUVBDeTRw?=
 =?utf-8?B?Z0hDOFRUL1NBLzdKVWVOY3NuaDBLc2RDcDQ4Y1ZEOTE3K3k0NGE5cEZtZzBp?=
 =?utf-8?B?cW5jYm9DZjI4b3BnbEpXWTVPNFJEK256Nnp1Ykl3a0g4cTV1VzBRdC9Oc2JR?=
 =?utf-8?B?QXNkWmlsR1lPbW83MzRIaUQrYlF3WG1PRi9PN1ltdWMvZng0MU1OQ0JEZmFz?=
 =?utf-8?Q?7dsyYXK31cAYO?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkdFNnFwY2oxUFpVQ2F2eVRCNUptNENtRm0rZUpnNTlFd3JFc3ZiQXJUVWhL?=
 =?utf-8?B?aGxjeVN3YXlibnBkVERrUlMza01zVlpDZENlek5tRlphdnNpSXBTY3hSakZB?=
 =?utf-8?B?K3Y2UlkwMFk3T1FRY2MxK3NiNi9tUHREd1EzU21XdkZ4Y0wxRFR6V3dwZFhD?=
 =?utf-8?B?a0xJVTZDMFlSRW5jaTVXQ3ROSUt0azNTMktPSHZZcWFaMldDdWE5dkxZOUhY?=
 =?utf-8?B?a3ZSbjdqeThsUTJwY05ueS9ESUtkQ0JhUU9JV1drVWRIQi81OEMxcVZ5am9L?=
 =?utf-8?B?KzN2WE5rM0p1cXpsSWl2VVQvNTh3ZzRwcFE3aWxQb1Uwb09yVXFjVUN6V3ln?=
 =?utf-8?B?T1BDZEh5OGdkanpkdlp0Y2JCRklVWkNtNGs5OHpYUTk2UHhJSGxYK2MvU1Z5?=
 =?utf-8?B?SElwZFNvRndYdjNLdk5xTjlmeW1WYThNQnR0L0JRcW5NQzJLTkJlbGw5akcw?=
 =?utf-8?B?LzBvRHVLK3NCYWNnc1BLUUNXKzNCSDZZVzlhRGdTWW5YWnR6UFEvV21Rc3F0?=
 =?utf-8?B?VnIvNUlnVE1XQm9zbG5aMDAweW9FSVNxVUVuYVZPTU9zWVFBUzQzWFRwOUNT?=
 =?utf-8?B?bTVIaHFvQ3VKcEVDaXU5c1ZqNVZOSGc4UXRWZzhQWjFNY2NtaFc2NnMyamxj?=
 =?utf-8?B?Rk01K2w1NXpWL1ZkazZsQlNFbWMybHlmTEtzMEVYZkdvWkNkRE9Wdzlyejlw?=
 =?utf-8?B?ZDI0aGZOaFJBaVlwUDdzYko5NkxpMTNwZHlMd0l4WDVTYXI1M1Q4T2VOdGpa?=
 =?utf-8?B?QmluSkorODV5eit1bjFtRktMVnAvVElqME1sNFZXdmdySDRUVGNUQTBiQnpu?=
 =?utf-8?B?TlcyaHdmSWFnRUg1Tmtvckh0bU1pWGRWODBrRW5uNHFFcXA4bWk4VWVCSC9Y?=
 =?utf-8?B?elhTaFF6ZEhXR2Q3MGZ4YWhuQzhVbVFlOTVUM0NQQUVFMU5JaXozL1ovVWh0?=
 =?utf-8?B?cS9weFRzMFdlYXk3aE5qejRVcUdIYkIxeE1WSSswNlVxTDRwZkxYVjgrMjhq?=
 =?utf-8?B?K3pjKytLQkJzU0xlbXVPOXlFWDJGMXQ1S2ZKN04wMW5IWVFoYU1Jd2hEVXpq?=
 =?utf-8?B?RlhrS3RLZU96WXFUakk3MUNPb1FNcWFaa0VnYUEwNjFySlZscEFwWTNSMjBE?=
 =?utf-8?B?ZmNtT013OVRZbnkySmdTblNGT3FpTnE2aG9LQVE0Skk2ODBGMWsvTFpYK1Zr?=
 =?utf-8?B?NVlRSXRRQUhsalN2d3JhMW02Z1BkUUVCakQ3eUU4V0IrZVp1d1ZsVVNsR2dV?=
 =?utf-8?B?bWVVL3RVWDBlRC82VlZ4bk9saUZiUUQxb2VUVTZ3cldOaHd3MGZMQzR6eEZi?=
 =?utf-8?B?RlNpVzJnSEMyamRUNmRhUTJudkpHSVRSWlhLWGxKdVpaZnFWVkJQT3o2ekFs?=
 =?utf-8?B?SEltVmxveWZIbW5VVVY0aXpRZU1ybUVvTlVNNXUrVVU4a1JaUEFDVGx1UFpa?=
 =?utf-8?B?eXVUWkFYU0lmQ3pUdHFsUkxXbTgraDZ0QUNTbGxmWUFnQVQ0TlFXcHBqMnA5?=
 =?utf-8?B?UDFhb1BKUFpOZkZIcWZpcVdyNjR1TG50RE8xVzhRM20xVEhUQzJGMjdUUzd2?=
 =?utf-8?B?MjVxeHNrR2NOeXRITzUreGhFZncxejkxYWFXdC9pVlcydVZ2NDRKNWRiNXBu?=
 =?utf-8?B?NTlwZHgxdjNEMzlRRkFadnk2ai90Yk1scTZkZTh5VkxJUHZmajgwWGM3S21S?=
 =?utf-8?B?L0owUHdxN0hoMXRtYVFvUFlOR2pkVWxLWFJ0UHV2TElvNkNrM0hMY0htckUy?=
 =?utf-8?Q?R90uSKUWMrMmqNrn3jx7cYI9VmGfKmyUr3X4t/j?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a54fa861-f056-413d-1b16-08ddff244709
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 06:49:03.4973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYPR01MB11458

Last updated: Sep/29/2025 @https://github.com/sophgo/linux/wiki

# CV18xx:
- Duo-S: Joshua continues submitting patches for Duo-S board. Thanks to 
Joshua.

# SG2042
- PCIe driver: drivers part has been picked by pci/controller/sophgo, 
expected to be pulled in 6.18. DTS part needs rework.
- Add numa id description: Pulled by sophgo/for-next, expected to be 
picked by 6.18.

# SG2044
- N/A

Thanks,

Chen

