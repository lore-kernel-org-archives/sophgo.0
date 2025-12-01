Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010001.outbound.protection.outlook.com [52.103.68.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B122D30103D
	for <sophgo@lists.linux.dev>; Mon,  1 Dec 2025 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592585; cv=fail; b=LaQ9yK1DV/+LN65d44X0u+qN4NWKHnef4lJ+8vhPW9ooo1XLzQNaN7xj5aTp1ij0hP2mpXtDL8FJ8JbDLCGgS2no/pqfcr1uMqhBDbK5UF0umEthzZP2/HIpQ5ItbUgWzGgVaYxS3a7oZSEEOFv5U33cStn5s/HK9GnkHXoJd2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592585; c=relaxed/simple;
	bh=qE/BXzzYpmWb4ATqHeKLSh/AugAR5SpApI1Owrx+NQY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Aoo7mdopVyeBiPP/akZWLUtbZQKMPkvg3XV+b4mQSHSPGWSEE3ozpqDnpIBLc5YVkCv9l0/i37Z/SZ/5uakdNSw0BHcGAsixNvYx3RaNkiMZdSlyJYON/xofzeVINBv+nJ7v6/CRBrJHgL9BWUB9Ogy8ny3t+Z3faqzaAUPGhkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qCd4jutn; arc=fail smtp.client-ip=52.103.68.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="qCd4jutn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esCyIAsQhPdIK+qYJILZVTrj+coJQZjxcd8cAl4fLSv8Af/PJkhZLdboiNtXTHGeGgNZ4cjYEZTgJC0zqtHO5jv3ZFAMtvP+4AbsAoFTwy3Fk3477fMFkUygvD1sIYT6NRroVHrZVH9r96WbZkJ37h8etztWk6ZKIlbhtD8BHBBLMvilh7Th8LWREh/kdSY7NcQ4ARRSn9j7FinJlfUFDztdcnf7QURYd49zN5rri+XgJaCisfoWPMZVVQxIHdxbEFq8yB4St1Pxst05oeRqT+TGS/QbSINnFcCe7/gwjtUd7GL8sDTbELA3v0jpYPsIuaBiWzDuaDGiPGmgUkBpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBqJRRLIPxLjtiJ/nCB9734RrOU8lnK+ZeHiSLCeHfw=;
 b=CyPs8N8MDM31H4aRMa0RtvXjw11rbxNYPHSmFiOTkshXE1MkZnCQzXt169PAWLhiD+enmYoecGfblvDcrF2kq1/JET6cFVl3O7MqdsRsug00iwjY3KWr/JT07c2Xq6ugKWpnRbzEbfEQBUE5UoUe6D751z7fa2BFAty0k0tTnwikE46P6bdryNYyh5DNF4NjaquZGQPRvKrU9GE4uoVQS4cY5xjgeY6mNnj7u0N23VqEYhcLkOcc7pcSMDWPFMr9FzTCiYVHB8B6ITJpfAxQE45KWDecwl7SaYP90oOzegfeZ/aubYr/zvg+f+jwUBH2E0anDT9pOQBwxH2KDhlAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBqJRRLIPxLjtiJ/nCB9734RrOU8lnK+ZeHiSLCeHfw=;
 b=qCd4jutnKHiMPVd3Zbafdq6hghTsmHs4NOTTC/WUNtU/TqK/YNRbjbf6URYGKo6XaY4jFrvfYhnaTVrDjMu8AegkNnMVeWTaRMBwIC30dvBn6Llr6LOqYvz1+cnboRx11BSFzVZIivJcDEBc2DNMgwPtFY/g5i5qZawED7SKKmU3S3p4ZG1T+Q3YDMe+dR7N9DQeJCUILon0CYWZ3vEZROdp2dP7BPmfGS5kkO6X51w/CxJ4LwhhC+IdS7sb1TsOk4Q3M6JlxKS2H2tgZ38xowrYYeTGdTDkxAx48RI8HumuJ7/36YOZodRbZsq6dfj5qxA6SOP5GRqQMKBsgy+/qA==
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
 by MA0PR01MB5587.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:36:16 +0000
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bae0:5b38:5068:9ec0]) by PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::bae0:5b38:5068:9ec0%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:36:16 +0000
Message-ID:
 <PN6PR01MB11717C796975CF645B54F11A1FEDBA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 1 Dec 2025 20:36:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.19
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Zixian Zeng <sycamoremoon376@gmail.com>, Longbin Li <looong.bin@gmail.com>
References: <PN6PR01MB1171757716F06749DD0AED288FED7A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <PN6PR01MB1171757716F06749DD0AED288FED7A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2f1::8)
X-Microsoft-Original-Message-ID:
 <f5b2eaf2-07c4-4afd-b913-26487d1a2a87@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN6PR01MB11717:EE_|MA0PR01MB5587:EE_
X-MS-Office365-Filtering-Correlation-Id: 23379ae2-d98d-48e8-68f7-08de30d63844
X-MS-Exchange-SLBlob-MailProps:
	YfhX3sd/0TV0pYzGwjM0bQROZVqV3svNRsWBFtp4uj3Ltes5CbQkTpiwH53YTBrGyj7P3fR4QOCkpBeVgHpt63XqkVU/ixMI5FEYI/FiBxMS7A/Irfog6M94eoIcMm5S0Cz/8WnxT1F5XVHV6wI6sZu67cHx3DjgxMqV4Z65/32+KnkLb+EuUqrZBFBJVUa/4h4VZquJsz6DcrQM96K6wHuuTuCkpQIITy3TWaEiPlk32FsTk4VMif7BKUYivqhX0n52hQFTn2rkmRbwZuHI096UEGxY4VzVNOnqJnZTeNqAHhPpPY0VPi91ktBLEmyap+1AqsDE9QYhMYYkByK9wTb5GjrkO82ox50rNKo0ZUBBC4YTDoXMw73UBES3r0HN/A1xSDdzgUaHsWaYymYtPAkkdWiYk8gTtK+CiulmyyPTlNpBREDwRZSzShz/6e/sxvBBbAI7G/2ZK2PCGbB3ol0XfqiEHx8c03tiOX/vc44oCdxkg3TcNsMLfqxXRyDHbo+NEPgHi0pJ73RRH3+eZzhw5Jst/0JlW6mw+ak3no5uDyhnxEPT70EE6IQOPn2k4ucEC7HJcMedrL78JIE5r9K5uBTNmjWaHesSdFh7w9ZauBjkN8zNGxkl6PUxh2UIzGX4T3ahpas2xuBovKY30OjmKeQC1NvqP4TDq8MbY+K3mh2Xf9EmjqaZA6bu7mtBN8Rm+ipK35jEVkf+17+WqmFUVf8auTgyO6/6P3+HNE4EAaLTG4aFZzq6GW4t/TFLMQuNZ0QxSbwEyTmxwoTnURZuBRUfmAz68BlCwUbSnqo=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|461199028|23021999003|19110799012|15080799012|6090799003|5072599009|440099028|10035399007|3412199025|52005399003|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czhLRU9weGVhcGtWNjJFdHN3Nis5dlRUSndWWTNDU3Q0VFV2Zm9nNm9RUHFX?=
 =?utf-8?B?YzE5NERjOUxnQncyOGFDUjYxbVloSER3VkxMWHdXOXcyN0h6RUswNitjNGhs?=
 =?utf-8?B?YlUwNkRyUzlNdmFJK0FFdnZRdWlUREJ2VTUybVUrUk1FQnV1cmpaL0FPSTUv?=
 =?utf-8?B?OHhCWEhCVnJBNStpb2RBWmh2YUlaNnord2U4Um1pMzRScGMrdDJXNmtRbU5V?=
 =?utf-8?B?Ym82WUlsSms5aXdja1J0UmNUNVprQjhQdExvbzFGdjJxTWYyZFVnSTJYcm9C?=
 =?utf-8?B?SVRVTWEwZVp3OVJiZGRYWmFvMEpBdXIwc3YvYlA5cE4zdDVGem9RZWdxbk1R?=
 =?utf-8?B?aURGblRtYllqejBpUVBCNGx3ZWJTRHdzanBxS1NEMDdEZld3KytieWp1NTdX?=
 =?utf-8?B?TTNSSFdmUmN3Q0tJNWtGRmtZclBQc1NjTXRFWGJyQ3ZQSVZBdG1yOFpMY21k?=
 =?utf-8?B?eXNIRUhDeTRTdmgzWWhkS2dPbG1NcnljOVh6YjVtMzlTSUNiejIva1NhQXNW?=
 =?utf-8?B?N3hxcnhzZmt2ZjRTWXNHeDBhUVNGK08zVHd0L3kxUGNTV0FWKzYzcHY2Snl6?=
 =?utf-8?B?YStxWmt4aUNNRzZSQ1FZLzlqRGxFd2ZHWnJRYnM3WTl6M0QxeFYxY2RrbU9q?=
 =?utf-8?B?ZmxQdzhJcFc5Mnl1UFhyc0MrVmJDSEk4akxGMzlBMlExMCs2SEpoZnk3dzFw?=
 =?utf-8?B?TGJGem1VK2xub3dYT2VEY2lIeTkzQ3FndUdvaW5OVVJ4em01LzhCUFhWVkp1?=
 =?utf-8?B?emtrYjA1MENOL0g0U1l4KzVmY2MxaGJ6WnNZMGZoaVowemxFQ1lrcFdMdzNu?=
 =?utf-8?B?bU96bkZkQTJHZ201cVdxVUtBcTdjRWo2Q0xmcDBiMmZqNDdZenlyNWp3WG5u?=
 =?utf-8?B?eklzOXJLbHp6RWlJTGxTMHBjbU9oV2l0Z2NYdERxNURldEkrQ1ZOYkhXeWd6?=
 =?utf-8?B?bU1vMnkxY25qcGc4TWQzVEhyZDNnRUpLRkY4R0VIdHFJTzhTL0xNZ1RhTXgz?=
 =?utf-8?B?bi9MOWoyYWllUkE2TngremVKUlBFNXF0RzlRay80SVV5OFFtN3laN1ErS2ZF?=
 =?utf-8?B?ODRjV1MvanFjek9kTk0yT0I5Z0dDYkVCQjJtMG41SUNCbi9SUDJINDl0bnYr?=
 =?utf-8?B?OW5XU2ZMRThYV3RaOUZRYmhwVjRKSTdZa1VFb1k2Uk9XSHRRWjZZMGN3MnYw?=
 =?utf-8?B?bXRDeUt0eUF6SHBXYmxIVnE3di9oSkx4akp0U2FJS3kyWXF4TFJ0SnExVmFu?=
 =?utf-8?B?bUxpT2dxNXJacmpBek5kZ1RuVTMyN0ZSdjRrWDhSYWF4ay8wQlU4ZTdNZUJz?=
 =?utf-8?B?OGdEZE55ZEE4MUpJU0Y5VW5BZlFWQlBkekt1VHNBM2gwcEZEV3BZWjNJbnY5?=
 =?utf-8?B?QXlCRjVVc3YzV0ZxelkyMkp1RDk4VGduTnljR3dzMlRkd0g4Q0wyRVlJdzRW?=
 =?utf-8?B?NjMwK1RHM1JxMUVWWG5GZ2w5ZGtpNjg2RnY2UVlXUm9zVVo5K2FjeTR2eVI4?=
 =?utf-8?B?bHlBdktQTE1ZcDczNjJValVvYW93d2NvNXRNanlWRHFEQ1VEZXZaVzdVdHFN?=
 =?utf-8?B?RUVYWWxON25BM05wQ1NBc2xKMFIzNzdpeWs1R3hqc1ZrRFJoUWVmWGt2eC8z?=
 =?utf-8?B?ODdOU1ZHUXR5b20xd01zdEgxYnNva1o2ZWt0RWlwQm5wZXFrZnNkbFVyV0ov?=
 =?utf-8?B?bXNCNms0UnlNNEVtbVdPWXJoNVhhTU8vZVVkSHNJWjc4M0l6VExyVnpnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWZkMDNFYlMxajd6OFdFZDN0TWIzOG1heXdIYU9kL283aXFUWXB5ckdRVCtG?=
 =?utf-8?B?eWhjUGtnRWpOMk9pVlBNNGxmRHRsb3c3S3FxZW9kODkwNEdIS1JlN21GT25j?=
 =?utf-8?B?clpETXJGeVppVjlsdGdSVEJuTURBZ0dISzV3WE5FY3dhMGtQMlVwYXhLTnAz?=
 =?utf-8?B?UjIyMWtKQzNodThid1hXRjBwSlNONzhCaU55b2hrY2hDWWlvMnFTa3NURmc4?=
 =?utf-8?B?ZytsQXhUT3Bvd0xSRWtUekFkem8xbHpmZTdkUmN1N2x6SExGOTRxRFZOdGN1?=
 =?utf-8?B?WklYTGlhQ1dYU1dUMTBvbXVMb2tQMkJUMG01MjFNMXlVOExrck80NUhiMDlv?=
 =?utf-8?B?dXBYbkREVm5LVHdrMUJMa3VXT3NNaHNTK09pb0xzQ1QzVHdNOWd3OTByVkw1?=
 =?utf-8?B?UG4vdnNYRzdoazFvLzlhRTNON01kOWh1WjRkcGVlcXdOSTVsRC8xdkVaQUg4?=
 =?utf-8?B?eXZNM0F4U1UweDB5T1VqUzNaWFhMRGV5MlJPZGNhVzB3WkFySzdmckVUTzJk?=
 =?utf-8?B?R2RoN2JmWEp5TG91LzNqMmsza1l3WTJlTFVtenBidEJMTDFCdzZlTjh0eXpm?=
 =?utf-8?B?VVh2QjJVYkkwdUJSWEJ3dEpLWVJMOTc5dXlURG04d1BzaGZ1eWxuKzdpQ2Zk?=
 =?utf-8?B?ZkRBb2tnZ3BvNVVEZ005WiszVWtDRjc4Z01YKzZkMWx3RlJHa0h6cE1Da01Z?=
 =?utf-8?B?QjNzODNrMXFXbmtMaVhVc3hSOUpvYU0vaTBEVHZKYit0Tk9wL25KMUNKOFRC?=
 =?utf-8?B?K2piUTlaKy9yeUgwV0NFcnJrazh6U3RCV0Njc1FqWFhuTG45TlVZRlA3cTFr?=
 =?utf-8?B?alpwdS9Jb3hEUFFjdXM1THU0SStqL21XK040TVR6V3F4MFUzdW1selNCcVVp?=
 =?utf-8?B?RU1qOE4veEV2UG5taFJhcElQQzgzSFFicEpzczhjVVYzSUF5N0NPM0ZabGhX?=
 =?utf-8?B?Vk5UUklEZGxJelZGdEVhbWFGZUJYSEhPbmNtNzdNMUlvVG1QaUZEcTFONEVC?=
 =?utf-8?B?RjJ6VDV6V3duTEVUY003clRvSkxkdEJEVzNEME1vdVVPZFdMMjNROTJUMlo1?=
 =?utf-8?B?T2NGSlVhdzZnQ1paVlJhMnJHK254YTdydW9tRm9mQlJZK1JSSGVST1haN25V?=
 =?utf-8?B?S0Q5M0krRFNBdnRiSlRiV0pFaDNqWmh0WUNjcmJOWFZkK1QvcW5YOWdVMjZx?=
 =?utf-8?B?NHV1c01wbHNZSHlEZW9pYkQvYTdIYlB2alY1TmFvRFM5S2dtOGVWRmJWaUFn?=
 =?utf-8?B?eEpVenlzSzN6Y2hBTi8wN0tDVDF1REVzMGdESGVMN01RcHdFSVFxR3AxYW5i?=
 =?utf-8?B?SFNRd3R4RmRIb1VWdytLc0pPL3QzL1l5UjRGRXJ3d29yaHR5L0R3cGFHWjU0?=
 =?utf-8?B?R282NFpyZWpUZHNDWHN1dU5ZVFNHNXF0YklNVzJiWDF6WlVoZXpuY1hrRk1D?=
 =?utf-8?B?dWFFTFRYTmJhVVNWY1lrWHM4QVgvNlNVYUszWmVBQlF5SlIzWFd3TC94V1dT?=
 =?utf-8?B?YWt2bzg0Y2tobnhmYXpGOVRIQVNEMHJDZStXVzNQcTVjd1h6QlZPc2ZyQjBz?=
 =?utf-8?B?U1RHTUlCSkV3NVhMdkRpTStqMVg4WUI0VWZCTmhyOVl1VlFJSVlva3BwNGFH?=
 =?utf-8?B?OFlXT0xTNThFU2kwMHRFTnlqaEFvYWI3OUFmVGcwVjhKTEsxeEVndVZLT0pZ?=
 =?utf-8?B?YU5QbWhrNjkwQ1RONzNzSW1BQy95R2VwYWxWUTFtRXhwdCtqa0ZFVG9QOXIv?=
 =?utf-8?Q?L48eB/Fvr/t7xu5w3RsoMUVQPgoIGounJl0yCBG?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23379ae2-d98d-48e8-68f7-08de30d63844
X-MS-Exchange-CrossTenant-AuthSource: PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:36:16.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5587

Hello, Arnd,

Have you picked this PR yet? I see the merge window for v6.19 has opened 
this week, but I haven't received your email confirming your applying. 
So I'm pinging you.

If you've already picked it, please just ignore this ping email.

Kind regards,

Chen


On 11/19/2025 3:24 PM, Chen Wang wrote:
> Hey Arnd,
>
> Please pull this dt changes for RISC-V/Sophgo.
>
> Thanks,
>
> Chen
>
> The following changes since commit 
> 3a8660878839faadb4f1a6dd72c3179c1df56787:
>
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.19
>
> for you to fetch changes up to af5eb17ff893bf6e52680a31059e1816749c2d20:
>
>   riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V2 
> (2025-11-18 09:17:55 +0800)
>
> ----------------------------------------------------------------
> RISC-V Devicetrees for v6.19
>
> Sophgo:
>
> For CV18xx serials:
> Add top syscon device related DTS change, the top system
> controller provides register access to configure some
> misc modules, such as usb2 phy and a dma multiplexer.
>
> For SG2042:
> There are two changes. The first one is to add DTS
> definition for PCIe controllers for SoC SG2042 and
> boards such as Pioneerbox/EVB_V1/EVB_V2 uses SG2042.
> The second one is to add DTS to support SPI-NOR flash
> controllers for this SoC and the same for related boards.
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>
> ----------------------------------------------------------------
> Chen Wang (4):
>       riscv: sophgo: dts: add PCIe controllers for SG2042
>       riscv: sophgo: dts: enable PCIe for PioneerBox
>       riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
>       riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0
>
> Longbin Li (3):
>       dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X 
> series SoC
>       riscv: dts: sophgo: Add syscon node for cv18xx
>       riscv: dts: sophgo: Add USB support for cv18xx
>
> Zixian Zeng (4):
>       riscv: dts: sophgo: Add SPI NOR node for SG2042
>       riscv: dts: sophgo: Enable SPI NOR node for PioneerBox
>       riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V1
>       riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V2
>
>  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml      |  80 +++++++++++++++
>  arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts   |   5 +
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  42 ++++++++
>  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts  |   5 +
>  .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts     |   5 +
>  arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts       |  36 +++++++
>  arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts       |  24 +++++
>  .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts |  36 +++++++
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 112 
> +++++++++++++++++++++
>  9 files changed, 345 insertions(+)
>  create mode 100644 
> Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
>
