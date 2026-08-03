Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010005.outbound.protection.outlook.com [52.103.67.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD53723ABBF
	for <sophgo@lists.linux.dev>; Mon,  3 Aug 2026 00:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785717162; cv=fail; b=KeTPWGS1iYdLZev0MpIqzBEZ7Ol7OgUf/FLN3YeVPbpAnlzGWp4bb5TgcL7nb2Yh5T7nzUdUPG5oZG+tb/gJuh0fGUXVJOTAjPxiiqg+p3gETQptzoBOi1FvaWg+fe1mt37ChALHgIhCTGEhmUWFZzKtGasc8ovssF1+/0dhfug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785717162; c=relaxed/simple;
	bh=D4an6r8lj++UkfoN9h/VhEoWzx/bwX22poRshgglqlw=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=OXSwHhmwcjZjoS2AiacsS+na4vbFdD3zMBfgoPnmXMEwJ9PqBjW5bmcr2rKz8je7MxKA2Wi51hf1p0DtFcucsoIQtSYdkCo9OMZ66yBLI3YAhZInSPIh3e7PKyPhF82oABhQeSYS40r3SEz/8UQ5gG8Ev95IDAy8ANVWnqru3zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=j+AOx/Sn; arc=fail smtp.client-ip=52.103.67.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="j+AOx/Sn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUn4kWPqlto6xZfVUtUEf7rYVxLZOjvsSCCNVOCGknnx7oTChv5TWGLYc7Zx5Wde+ZcxEK8fVY7sq0D0UoM2TR2zNU/zhrc+CfzZEcrF7EgRgW+ly4Xe6tf4LIPZupZr7mq0Mrp/EcLe+EqQeIM1FT5yOahH2FpB6qA027ecxFGU/aXUxAqvqB1kVGkFUXDwlA+44igOCXlT/skrVh0HqKY6gDZrfHD/u3dz74J7LidkxWQbJFMc1pRAe85txCWBzvV0o5GecqSODhFoS4+BAS2szv/eVxfbTfzzCfVDY5DykTFzBmGJW0SKZ+s0jXxouP2ItY/KPsjoKKuo26mSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7i961iPeU3EEotZr4gQJfwpRBVHX6k6b/gZCKu4tEko=;
 b=VE3v/qxBp/YnxktvBlMxrAmQVoAjfiHBXsRfhzTV3phUa/Ug0yxTjBbtyX9AFL0NYXi7ocpXhFcM4Y0XqDvxyuaGqAmP2D5v23Ek2JBVpHppno2fNGGVMd8a412oSfGzMI2jTBQa5nD44NihcS3yV+cZcLXty/kjQQotfHJoYb4RJ+u+fVWbuZMd7CMI2Nq2rg/VUB3k5Qmuy5w+iz0SmGXGi+fvA2Cz01eCXYtV/epBYbr6/PKd0aGPljYOmDJcoWm53tsP0lfMigHcvy9+RUs2GWn7ZH3PNkYrDDyne3MymX36Oi18QhOWFhWo3CVBCvXNAbPt3BIT16v6NcYwgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7i961iPeU3EEotZr4gQJfwpRBVHX6k6b/gZCKu4tEko=;
 b=j+AOx/SnWpoa5X4OpA3qP1QkwAZ+vRtt+1mqhvMWTmir0C6p1hWUmAmhoCMm+zV5dSotS8u8T10+XRnYbNCXZmtd0qAxJf2dvCuHk1/bXJ/9LHd9LVhYNG5EDBxwP0SDS1NjvnRuX4h9LwWc52XITjFUkSKUyEvbRirBvfYuajKcFyDF7qmRDf1XQKBSSiwvzFg32H6V1PmTa1DyB1u/9Brhju96CNEU+fuBhoNWJjZvxTS9BW6s8RmqWeGCaDLLHCiG2ir9q5NLPjukIpeH4tcPnDvtElsgHJikA8HT2MbmsZEZVhkMtFbJ+/3Kqkxf7QZdsib7ZRpkquoLenhMqw==
Received: from MA5P287MB6080.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:230::5)
 by PN1P287MB3773.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:251::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 00:32:35 +0000
Received: from MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca09:8db4:b558:2f73]) by MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca09:8db4:b558:2f73%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 00:32:35 +0000
Message-ID:
 <MA5P287MB6080FE91635E4FE28ACF4D7BFED52@MA5P287MB6080.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 3 Aug 2026 08:32:30 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Aug/3/2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0041.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::19) To MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:230::5)
X-Microsoft-Original-Message-ID:
 <faff0213-bd8d-4ade-8e80-aa003a2b374c@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB6080:EE_|PN1P287MB3773:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d32891-450e-4cac-41f5-08def0f6b621
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799012|6090799003|25031999004|22091999003|24121999003|25010399006|22402599018|8022599003|19110799012|24021099003|23021999003|8060799015|440099028|3412199025|4302099013|10035399007|3071699003|2607281247196008|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b1BBYitSc0EzSlZhR01XTzJUMk5UYnBsRmxpMnIvYUJLRnJVUnZ0YVllMkdr?=
 =?utf-8?B?M3RJaU44OTJERGQ1c1pmc3hlVzMwMGxaL0wyV1c2OGkrQVFweC9OL3M2WlJC?=
 =?utf-8?B?T1dnckM3RU03Mm5GbWNUT2pPdFoydUpuQVd5TkNLYk83NThHdTYyNC9TRjRS?=
 =?utf-8?B?R0UwYlByYjFtdDJYanh6UmgySTRISFl4WHNoRmE5R0QyUmNSbEw1aUkzTzNh?=
 =?utf-8?B?TDZhYzByZnpUWHdYdFV0N0NCcC9KeVRBeGR1amZUWEdhSml0VmRRWlUrd0Fy?=
 =?utf-8?B?MkVhbTQzbDV0N1VXMFI5WEZEZGE0MXBUUklqRXQxU25XRDBuVEJkVkIrQ1oz?=
 =?utf-8?B?RGkvSGVCREJkaW5DZFd5K0tWbnM3aDlFdVhreEVKQWRsaHM3S20zb3ozTnNU?=
 =?utf-8?B?QTJOckNVOG9PYWozMWpPMDE0K1ZKaHgzL2ZiK0JOMGkwSXJweGhEbUQzaFp3?=
 =?utf-8?B?MnZ1L1Y4QW9CK3daQ1RaQ3VwK21Yb0VnV21KWWNwOEJzMGZWZUFNbDQ5NG4z?=
 =?utf-8?B?NTh1TTR5Q2F0ZGhPMGpYeWRPM1R3ckZ1eXhMbEJ0cldWZjExemZWOSsxNUR0?=
 =?utf-8?B?QTk1RVZyZ3hkNWNqT3hBaEV4ckNnOElsU2VpMUhWMmZoRm5JU3lobkx2bnRv?=
 =?utf-8?B?K2N2TUtxZmpJQlNZSXNPSmZTZmlsQ3BMUkRvMktIQ0hQN0ZPU2h1c0U4MkVo?=
 =?utf-8?B?U3pzNXVrT1BsZGgwSzdCTEN6V09jL1NHTkdwUjdSN2xPaWJSODJUc2g0bHF4?=
 =?utf-8?B?Tk1BcjNGZWl3NEs2S3ZUa1VSeDlENndNWE5UZnE4VFNCVGFiV1JiTEJ6OG9M?=
 =?utf-8?B?bnp2NTEwWkU2YzlxY1ZieHEzNTBFUkd1S1g3ZE5LLzZzcTBGUXhSY1REMVEr?=
 =?utf-8?B?eWZNVEZOakJwMWhCQUVYb2poVnlwdC81clR1c0VnNlZ4WFY5NXNONUJsUXRR?=
 =?utf-8?B?WEk5UkI4T1RKdStSQXZrSU9lazEvRzVmdGJEdUFjVkV5WjFiWEtmaHVSRlJU?=
 =?utf-8?B?S1VrZHlMTVI4Y3EvV2hRRlZybiszYUxnRnRMbWJXNjg3NjIwanJZWFR2VE5C?=
 =?utf-8?B?RVZ6NU10dHkxYXdidmFxZWZjaEt2TVZrSEgwaC96WDdlVnNwUDRiSTFLYlVD?=
 =?utf-8?B?T0U5TDBvUythOGZUYTJQTFZKYVNFRTJ6eUw1Q3N5LzlDRGU5Zld6WUdGT1Nj?=
 =?utf-8?B?eFIyRmJNTXZJeFNvTFArN1FFdnFVSjBUVmw5RWRvVm5oNFF5Q29EUG9Yc1VE?=
 =?utf-8?B?Sml5T2lrWVVwZWw5NVVFUzN3TFJUWEl4Z1pmZXovYzVCL1k4amREOER3TU0v?=
 =?utf-8?B?MGFqR3dpUEI4WGxyQUlISVJsajdtSEd3aU80WkF2dHF5VXJCaDVXdHB6Vnh2?=
 =?utf-8?B?ek5lWnNhQ3IwdEQyZHo2MFVtL2Q3S25ibloydlNVRk1NeW40eUtUYUZqZ1Jw?=
 =?utf-8?B?dVpTekt3OUV5TmdtdnhBZjdPK2dUV2tWME9nVmJDUW44b25vVXJPOCtuYTJa?=
 =?utf-8?Q?31uTgg=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWZNOTI1cVpJWXBpWVNoYjdhblM1WXVNWlJZZThCdDVJRmRwcUJnY2dLak1J?=
 =?utf-8?B?Y0N2cDdUeFRxbDRiVlJwUjBSMEx2ZExzekRFQjVNMis4MXR4UGI3VHBONVhs?=
 =?utf-8?B?ZmI3Nm9yZ1NJU1pkUGpNRUN2K1hRaG5Lak5MZ0NkWjIzK0JtMUtzMURJUiti?=
 =?utf-8?B?ZUU0SGRGWTg4OGJ6ODNiOFBUYzVlaDZlRVpwb28rUXdhaVFVR3FXQVZreXEv?=
 =?utf-8?B?dmNzc0R4cjhNcFRNSnBITnpQaERZM21ZdTgzc0tCUjVjUDdlWjAydExCOStS?=
 =?utf-8?B?Z21kL0U4czVUL0h1QXpONzN5OVA1RWtrNnZJYVU1cjVrMCtwZnQ4TVNET0Rs?=
 =?utf-8?B?eUNEUmY3UGJHNnQ5b2h1aEl5VWpGa3h4NGlXNXVMZlZpaFUxcTRSczVQK0lH?=
 =?utf-8?B?dGdhU2U3ckd4aVFZTjJXK1FuYWs3VGZJZTI2NVRWbGtpaDFsa1lZTjBHdm5w?=
 =?utf-8?B?SFFPK29vbUhsL3NiQ0lUN01jVmtjVDd3dWxtclZDc1dNZEVhaEtKYnUzS2dr?=
 =?utf-8?B?SUpLMUZGNWJLTFI4RkFqZUdtVUVKRThRek12c2ExN3JIdklmSWtqaVVuUll2?=
 =?utf-8?B?NksrMUtLV2xlZm5TNWJBbll1MTRQOHJGWmVINDhtTFB3djd0bkZpK2RBbkU4?=
 =?utf-8?B?aStvNittL2hlR2VhSlZvWmJlOWVyTXN0YXlDSklhWlNxeTEvSjh1Q1UwLzd5?=
 =?utf-8?B?dkF6aDZnY2ZUUm0yZ250b210bExhQW9PWlh2RlZ0TENqaWRucGRwdmE1L1Rs?=
 =?utf-8?B?ald3aExrYW1na1F4SXlWRjlHTTRNM3JJNGhlaWNmRmR4dUxFaDg5ck9VQVBo?=
 =?utf-8?B?ZEZkTkF6MzRUc0Q2SnorNmFGUjRINGZlaFQxVUNZT2VVTGxMTllPTHpMZ3dO?=
 =?utf-8?B?SlFvMFJMNkpJTHNadXpyVlVKbStDbFBZY3habkErUjBybnEwaEIvTHgrRzdE?=
 =?utf-8?B?dTdVZzlTdld6MlluT0p6UEN1RnAydjVWdlRPMVZkc08zRnNMRFpiWGp5YlNn?=
 =?utf-8?B?UFl6Y3lPOG8rNVNtU2tjME5yMXZ6L3JySWtCaDIwTjlDekpqbmFVRmtiNit2?=
 =?utf-8?B?N3JkSjRObXFuWnMweUlhOFRROUg1Z1krVGJLYTZHeWc2Ry81ZDNhNWI3SDhE?=
 =?utf-8?B?ZDBhNjhTeDVVaGZEbkVycTN5QjBxak5DQTVXMkhOTVBWbjMzNi9VL0VtbW9Q?=
 =?utf-8?B?V0VTSWI4S0JPV3RRN3FlbG01eE1IajNJMVphM0RGZytSSzJGVEd4eEN2c3E3?=
 =?utf-8?B?SnZxTVNmSytyTVB5R0VVbHdvSHlhMmZNUGQ3Tk43ekIzMzk2R1VxTzA4UkFB?=
 =?utf-8?B?bHpXODFmNGlVTklmb1l5VTgweG1jbHFSV1dsUUJxWDdaODhKOU1JSjJlbmxR?=
 =?utf-8?B?Tzl6QWdhakdIaTBTMnRXMmp5OFQ4SkZNSUpla2I3VTNXY2Y5SjlpNEZKVi8x?=
 =?utf-8?B?Ums5RXJJa3EvR1JPTEljejVIaU1nWGQ3LzVSZjRzWlJRZEl0VWoyRVV6TGo3?=
 =?utf-8?B?VUNxUk94dDEyTlVaZGdQME1DeEhhS3RFY2gweUgxRHQ1SGs4YXRFRjNXenFY?=
 =?utf-8?B?U1FJUHpUb0gyRzFHaHprWEJCM01kOEc1SUIxTlM2OHN0WDRlM01mY2RqM3hM?=
 =?utf-8?B?RzJjekJwNnNUUVpXY3Fub3liU1p3aUVHL0tPdjZSQVArRVJKUnY2WWFhSVVs?=
 =?utf-8?B?d1phd2NJZmdNR2daV2UzaHEzRG5lZzRhRGNsRGtwdGthb1prWTBxUFdTRFFw?=
 =?utf-8?B?UmtUVXRkTkFjdVNCeDJNaitBNkE2TWhZL1NSMU9HRFo3N3V5RUdPN1VwbWJZ?=
 =?utf-8?B?UXBPNEdUZXpFN2dpVWhkL3B5RTJya3dZU1pHc2NmRWUrNEx0YkNlUko2OUFX?=
 =?utf-8?B?blhnNGJFVjhLMFlSb0JIRENrb0ZuRVRJZHRVUjZxdkFIU3dMYUErd1p4RmJX?=
 =?utf-8?Q?vxWvMqLKxUIngxMOMYvKj010tyHJS5W0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d32891-450e-4cac-41f5-08def0f6b621
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB6080.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 00:32:35.4996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3773

Linux Upstream Status updated: Aug/3/2026 
@https://github.com/sophgo/linux/wiki

CV18xx:
- Duo S support: updated to v6. Bindings part have been applied in v7.2; 
dts part are picked by sophgo/dt/arm and sophgo/dt/riscv, expecetd to be 
applied in v7.3.
- Duo 256M support: updated to v5. Applied by sophgo/dt/riscv, expected 
to be picked by v7.3.
- Allow DMA multiplexer set channel number for DMA controller: Binding 
part is applied by Vinod, dts part is applied by sophgo/dt/riscv. 
Expected to be picked by v7.3.

SG2042:
- N/A.

SG2044:
- N/A

Thanks,

Chen

