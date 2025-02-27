Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011037.outbound.protection.outlook.com [52.103.67.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D83D1581E5
	for <sophgo@lists.linux.dev>; Thu, 27 Feb 2025 03:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740627167; cv=fail; b=MmaOEMdKDdqVkCJXk2XuDTWLl90HWvlFOyI52qcvwL8m3NTQcQDKnnTmKRnUJXLM7nUJC1f0PbYYsPhS6luRSRSNH3CKSX0VUlCEUS7eCHYx+7EDDwA28YJ3wvMH8dR+zgeGk+rZb6LnjfLVdI3n4iJioZAST5P8rA9yDzqBzDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740627167; c=relaxed/simple;
	bh=2yN1zaMPTb/DnuFS6rs3ZrU96cuw5GlhwCwbF8nC1kk=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=t0oxXm00+1lmQI7M1rBYxhO9j84/SO0lD5uqGvKoi4aMCYqwL8+7qrXYgxeG6T++mHkZ7Jfj7pA+JIpmK2WaAv3lCbvqB21RGHWlYu3mvgpCZB5qvtKfnOvE2eVEA05Fplst7XGPSPozptKNDpBb7tUyB1lRve9EpMGDwih27GQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=MmIvzwjp; arc=fail smtp.client-ip=52.103.67.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="MmIvzwjp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jC8SXN5sofA2sJP7Oj/7doU49emkkDRr/N41GCQtLUqV2EwMMuO6DWnb2TqFjm8nElJG3xiiMQXFzJC2/BPZ4XJuHmPXoI0qd9jZRqR3UG5Nzrdyh+sXRsJiycAUwwlw/Zx2sLl4iTC7wube2BmbVoFnStrmCZpxFq3iFaJgBMs1uqI3sulZaeXOSew0c5gkzZtKBhaEDbL81HxfwZFia4OGV/ocgLC/jwcvT7QT4uc2SNB9obrb9hGMr6vvoZNc2WPZHsEjl/90l0ba/97MFINLyxcha1bPP/4hVF7iH6JFkDKeYQUYWSIBGaZyeiaTeM98oSndTyByajdZKBNxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTFI/Wnkl+cz/jFyu3dU7iXyE4Kw0fegAACNlx0diVo=;
 b=te9Cx1jgiBAXR0GvgLys0qNQHLq4haN9+7Hc2+fyI1BsrQxUt1UFiqFOfmF2VeWNhYJqyhQ02o5qwdWGFcA3h6aAShj+bmI3vbyjUk03LpGd88pyhX6jlIJ0yWnaHxVRYLZ7DevCBDYSWQVaULRcJW2cUhfOKURWcwlLKs9TbGkHQW7+2qOSiD8/I1GrF1z18pTqZOZJpEMela9kvtvKT4CaU/Q4YpCYI5uRfcZU6zv6WsTjURhwYauMNXRP2QUiwJKl33Zgydm55qxCcSMaeb8sVSXzXXY/zInW1htxPVzKW6vLDW7BAO70+8KZVjd4c4U5j02TfunAsapQTXiC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTFI/Wnkl+cz/jFyu3dU7iXyE4Kw0fegAACNlx0diVo=;
 b=MmIvzwjpt2VvXueHCzwdvLM+T8scKqYI9wf1J2bu9TlSJsp6tHmR6sG3jIkyp7BZV26nRyOcV+dNPLecYbmv72c0Cyo6vhNqIHzO6BWle2WWzeXZmF/Se084S+ouAX2r9l8r+emi2xDyf2SKWACAy10anqylCQA52bJzEvRzjO7AXvsZGt46CQrSrzHlvlvbV2De940hclOTEGd18ZKXGZBNo7dXmnEJQds/kuTJbl23XGdMCspiLRvbaC6BNj/q9voxWY8rd0uavgVyiRPFSNZ7Jv+LhuknQTm7CrTQBH1O/VtkEgqOrYoiiagRSVsXEbghQtJMTG77TNWxSelpaw==
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:165::9)
 by MA0PR01MB10144.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 03:32:40 +0000
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e]) by PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e%5]) with mapi id 15.20.8489.019; Thu, 27 Feb 2025
 03:32:40 +0000
Message-ID:
 <PN0PR01MB916647EB69E193C365A69895FECD2@PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 27 Feb 2025 11:32:36 +0800
User-Agent: Mozilla Thunderbird
To: sophgo@lists.linux.dev
Cc: Liu Gui <kenneth.liu@sophgo.com>, Inochi Amaoto <inochiama@outlook.com>,
 Yixun Lan <dlan@gentoo.org>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: SG2000 TRM v1.02 is released.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:165::9)
X-Microsoft-Original-Message-ID:
 <e3efdc60-8e7c-4855-bff2-9ca3b87c2315@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB9166:EE_|MA0PR01MB10144:EE_
X-MS-Office365-Filtering-Correlation-Id: e5fd1bdc-2c18-4590-5f7c-08dd56df6359
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|5072599009|6090799003|461199028|7092599003|8060799006|19110799003|10035399004|3412199025|56899033|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzBpdTArOHM0RGVCQWpRZ1NiMXRGb2xwQmtBMGI0ak8xeVFSclI1TFpSRHVK?=
 =?utf-8?B?WmRwOWNPWU9KeWwvNDBtSTBZa2hmSGlCOUdGenlRVmJWclh4NXZSQkNkTlBR?=
 =?utf-8?B?TUMzd0Q3WXp1VTh3eFNkSk1JOWZLTStTcnNDMS9LTU1KTkwxbVF1NDB1UlR6?=
 =?utf-8?B?YmJRYTIxa1FJU2x0cUhxRW5GVFYrc0FCWUc4dGQ1V0o2Y1pWcE5TVXRDUC8v?=
 =?utf-8?B?ZHdHcXpZajVHTnU1OWRrMVBvUUtHUXpWOEMzbDNqK0JUS0k3MDk3NThzcmhL?=
 =?utf-8?B?NnlVczlUTjhNMHdnYXFNOEVwOHl2T0JJYWlaeFBFRjB2M1ZJaHlaOVJHOWNl?=
 =?utf-8?B?UmdQU3B4Qjl2WndMMjlPRFQrTHlEMmVEOXREeURkSDUwYTVqY2dBVHlMaVVx?=
 =?utf-8?B?bWpDSGhwVng1SStLK3BsaXc2MGJoYVVlNFpramVQaXRXMHk4MDRBeXRLU1RZ?=
 =?utf-8?B?ZmFhZnJSajFpK1llc1ZJYXRvWlp6eHR2NmtKUnczMFNyOHRRS0c2RlBFYUc2?=
 =?utf-8?B?T0c5MmFOc1Axby94U0Y5NktaaGtnUEU5dXlaVTJRRUVZU2tsUzNRRER6bSto?=
 =?utf-8?B?QlQ2L0E0aW12VTFnajlKc2x1TUJ0cTdNWTA2VktMTHN5OVd3ZGdmZGpUWTBK?=
 =?utf-8?B?Y0hSanl1WlA4K01TQ0ZaeFVOcFRyZmR4LytHMzk2QmNiZTNQT3VZZzZIeVlQ?=
 =?utf-8?B?dFoxRUUvWFEwdkF2K2FTWExRKzdMY0t6anZwWWsvamkzaWFQamdOUUpuU2lH?=
 =?utf-8?B?eXNzY0szSDA4TmdZT2VNRHBjMC9JOUN6WVVDRFhmRnJsRVBEaWlrWGxha1BT?=
 =?utf-8?B?emZrNWh6TUxWamoxU05sNmV1NmRNODB4T3hBMDZFc09NU0hzeng4ak9HMlFl?=
 =?utf-8?B?YmtrRHk1dHZ6OFE5UUpGdVFzdDAyT2lGMUVraC82SFkrV1hjVmNBYitxVkth?=
 =?utf-8?B?R1h1WE4ybGtWTzF4U0llS0ZYZnE4TkliUUNXU1hBUmF1VUVLc2dLcmFTb1ND?=
 =?utf-8?B?YlpVL0Q4VE4raDlTb05Nd3BPUUk5bUFwNm9rSnA2cW55d2IvTlEyWmdhYUhM?=
 =?utf-8?B?bmFpRElOZjZzSDVaYWh4R3RZV0VEVDZnc1lMZWhmUk50NTl0UkliU2FJZXd6?=
 =?utf-8?B?bHRkUzZySDUvYkN1NW9vQ3UxNFlHSWZOWHJIYUgvRm8wYVVCUWQ2eDF0eFg0?=
 =?utf-8?B?bktBZ21MVE0zN2VUTERjT1NTSEEyNVpoOS9tRDBvdUQ3Ri9FZTNSWjVwMWhY?=
 =?utf-8?B?SHZ5Um9IVjUwK0t6LzRZMmo5M2RHNXhkWGQ2TEJrSVlkS3hlaVU3bHM3MHdy?=
 =?utf-8?B?bklkNmVLanhKUXFseFV0eTBOSnRvMlJjQTVzVjh0b3BkQTF5SFZ2bGtxTGxF?=
 =?utf-8?B?d2VNcHhySlVlZHFML1poY3RzRUl2TVppMWN4dUk2L2JJYXA1QzFGckM3QWN4?=
 =?utf-8?B?UndTcFFIdnpyN0VaYVNud1pNK0pHV0VnR2Y3SllzcHYwaFJsM3grN0dTMnR6?=
 =?utf-8?B?YlhCUmFyQjhFeUw4UDhSeGlUL0IrekRYTUF5c0RrbGM4SFBsZ0pkY1RpWTZK?=
 =?utf-8?Q?sxaMGFFreW6SNJgz7Wy8xN13s=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TCtBV0h3RkRUQjlNNjR1Skh2Q1RkM01DZU5rL0hLbHpWNno2T1lDUU1CNDNR?=
 =?utf-8?B?ZjFNNlZyVVJyYytXSjlRbDM2a01xNnRueGJCS0tyTzA0dUxBRllJQmdrVENN?=
 =?utf-8?B?L2FuWEI1R1d0L3JVMW92ZTFvQ0dlYmhRMlN6a0V1cVdhSkk1RlJkMkxiS3Bx?=
 =?utf-8?B?UDE3UGhpNmpYSkFvQ242SUNKNEFPTENHeXZkK2JJZjVhZUVVOENjUWlMTkZo?=
 =?utf-8?B?QXc0VFRDc3RDcFVBd2FKcDJ5a2Y2S3l6cXF2UVhUbGk0dUMvNU1pREg4S014?=
 =?utf-8?B?aXhWVTBSSzhtdFJHMjhuaGxOL2Q5bDNPVVlNdnMybk41ZU1DdDlXUStOTXlm?=
 =?utf-8?B?cW9idkRqczYyZ1QxbHFKVmVkcHRuaXBYaVYrZWNjZXV3UVVsdjFDM0lNUHhB?=
 =?utf-8?B?enRVSlNQY2RJNmtoWVVkaHVvelIxMFExUjZSVXE4bjBVWFE3QkE3SUFZWFp2?=
 =?utf-8?B?WTNVdmJlZWcrYXVHbXpIWXBtU2dCR0lYSTJBWW92L1NndExtV0lUcHFsSVQ2?=
 =?utf-8?B?OGxEckRBSVR6Qk9OUEUxdXUyWC90bVgyK1QzYzBkRmppNmkySWY3WGpXN2Fi?=
 =?utf-8?B?QVByT3l1VTN2TDN5NkNvRzFYa2x0N1NwRmxHQnpxNDBYWHpyL0JsQmhqMTYy?=
 =?utf-8?B?aUwwRnBtVStQMU01VUFpSlRBUjNzUVBMN3NibHNvaVdTc1Rxd2lpNVhOV1ha?=
 =?utf-8?B?c0x5ei9JRWU0TEF3S2ZrbTcxeTFpdzA4VXJLUDE5ejYvQVJhSE02WlhITUM1?=
 =?utf-8?B?SXhsQXhaOFJmcjM0VHFqa3QwWFoxT0NNNzJLZDFna3hpSWFqaVRCYStKUGxQ?=
 =?utf-8?B?QW9TUTBLcUJybjRlSG1GdDJoQ25zSUU5a1NjQzZ6N3Z0MHl4Y2NFeVVKL01x?=
 =?utf-8?B?Y2hiSWZEOXp3dGVSaUtET2tnUXhZWDlBbDlSM3AxcDV0N3JGYkFxemRRV3NN?=
 =?utf-8?B?UzIyN3FvYzJMT3dJWU9NZ1d4L0JiSkZYRWxOQ1E5WkNJTk1ZQzhudUtqT3BF?=
 =?utf-8?B?NmlmYUd6K3JaSjhYMWZMZDIwRFZRTDEzRVJ1R2owcWEwRXloRXF0UVlERFFj?=
 =?utf-8?B?VzFTc011NEZkNGJtUnJ2QUNmVjVtZ0xIN0VOeFV0b0t5NS9BRno2Z0JPUThu?=
 =?utf-8?B?UG9nQ2tBWVZSR0kzT1ZVTStwZnRENU01SmlOOGlEcnEyM1RzK1ZqVVl2V0Yv?=
 =?utf-8?B?STFRdmJCQkF1TGtucUdYTnBTZFVmMkVIWUc1K3dGTEExbjhUbUFqckt2RWdQ?=
 =?utf-8?B?dTRtdk9NcUJiYnZHMDIreFpsM3dwWVdnaDdzZ1JSWVRnbDFoeGgxSmdLeUJp?=
 =?utf-8?B?N0ZmZEcySWxjQjFIUlZmOEVnWXJNeFBCZFBocFRWMHpPZVBkSm5TL1J0RzNN?=
 =?utf-8?B?WEVkTjdlNURKaFhvRUIxUUQ4ME9YRjJkYUIvSVhlM1dFeEFobGYwTTZGU0E5?=
 =?utf-8?B?aUpYcnhFcVNKUHZTd0Eva0FvdmczTlc4bCt3QkdxNDlzdnYvZ1pMdFAyUng0?=
 =?utf-8?B?YmdaY3NhRUNxQzhScm1ianAwK25mK1RBZzZtSElqS3pNL3ZTSHYwaVBwSDJL?=
 =?utf-8?B?RmVwZ05Kekd1NUJic1BKQjYvM0JjN3dielJYV3Nnclh5OXcwNytaZk5hMUEy?=
 =?utf-8?B?Z3ZJaktpOGU3NUM1QWhNOFpsK3VkY3l1R0NCQjVhZXFCSWtHZ2JFQ2dQMDFN?=
 =?utf-8?B?Zng5Y3VhY0lXcGMrd1p5dTZCL3F2KzhXd1pZcmFDNDhrak1nOHdOenNOTmpu?=
 =?utf-8?Q?rrIbrBdkGzndf4Y0WklG7OAGypARP6bfb4O9JpM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fd1bdc-2c18-4590-5f7c-08dd56df6359
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 03:32:40.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10144

Hi, all,

PDF documents and more info. are avaliable at: 
https://github.com/sophgo/sophgo-doc/releases/tag/sg2000-trm-v1.02.

Any question or bug report please open issues at 
https://github.com/sophgo/sophgo-doc/issues, and being titled with 
prefix "sg200x: trm: " is welcomed.

Regards,

Chen




