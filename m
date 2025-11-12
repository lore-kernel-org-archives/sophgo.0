Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEA638FB9
	for <sophgo@lists.linux.dev>; Wed, 12 Nov 2025 00:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762907242; cv=fail; b=rKxRwyw8HAuciN1m/uRjR8UBrHnsJBCCheHV4mT0W82aZzp4Zp9Fk0cKlFBZlfoFE9X75Bml1EYLYA596MMIGWtiy4D9XkhaclXRqXSDswWUM8thG0Rtd6AKISkMLrnWMzvHy6Zyd+QV2L8bxwSMEXuT2wXfD51xW3e1lGgHGTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762907242; c=relaxed/simple;
	bh=P2jFKnGjNRfgGaozcG+mg3h3NJHsWFOTD+cZxfraZ7o=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=MDMjQrTb8x3exklKW4uJHsZTLH+68VwzaE/MQ1BZhjMM7aBSxFX9NMEcz6x2RKLfDJycdN2zd/HxZAnkBCYFmyhdrXCJ0mOl4mdNAZq6Nj5g9NRKg/QwlhuCpI5DmXJMPjcNqWgwroPba1cwOzNRPsfCATZk2q34286mL4ziNaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lqutVggu; arc=fail smtp.client-ip=52.103.67.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lqutVggu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwpBHmJVFMbfAi/IqjXy1ePkzIw0Th2VkQk09kVrbtI/5EK8E3hSvb6FmzDMvBLUvTQZwXgjnXxcqY2SMzI/byHQs8/WEDF3MOCO6mcnDAi5Qn1Q7ItHtMKgmTR3fRYcG6YDUpiu/Ir6raqwx7fXcozYiiqCJZCS3gy9pxF+4d/VOdi2SQ5RPszN6TtCq28dTXYTZzNCaRgT0Cc4frh++f0Oh9CC1lpvYROfgrXb2Qs3Hh4EP0GmgfWpQAifhd6iajfH0fExeqKDZVoJcxRSl8czivKg9mXTTsABsmf7AlnjSpuxUU+pUJ+JGOlIKC2BGoRdCpl6DZnJSbbm79SiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2jFKnGjNRfgGaozcG+mg3h3NJHsWFOTD+cZxfraZ7o=;
 b=wZ64XBQ52R33FEDF58AycKlxzZzdfn0KA8QDyVbwsgGuVKruHT63M9xt9TBautY/2c2DI4RmcM6B79nwzCO0T+8i82wk/wI3obaukH0+Y8drF4PTO5b3aZPoRyHl6mmTNX+6PQNcnVsuzwxP3KTTbSqqyyJ4+m1g5tqt3dglbq3OhVDaL4+K7suoIUxmU7hOvIA31mheoLRUMTU+6Weqc+k88K3ejxHKeN6eCPbq/By00CPNDge26weGICPMSqY69klh7x5BXF6eqLYlKg7DzJ0yUAe6bhoDHb77iomiVFKt76xlW/EG94PkGdQ3QNRuQivQTNp+eKnTMIPlutcDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P2jFKnGjNRfgGaozcG+mg3h3NJHsWFOTD+cZxfraZ7o=;
 b=lqutVgguqn1Q2GRwtNg/FhvFzAfMr4nNLQc37E5Ebq25nANwr/sQYQzQSeJIlF9dB83ILQbr3/w56rr10FS+gubuxMXatGY0lm/IU4NhQRj+/EWsPLsH8LUYKyt04d0t1kowFg01OhBbhHmWAXCDx15EOzfmaNpSbNK6+T4DOWF1Q18n/CfTuQfS6UYun6fp7wxcVmQCn3DWft6KYNuw49gDs5zR9eKPFTU/vMqDESIm60WVEHFPbsf9jNIJTt9HymNFZoFsdhRcxdhUCzOIywpbExl2I4o0pvsX6bqkqZniaG8mW1lQyKvqoy+EOoBNsUEvX6sAKrXV8me0iIIW7A==
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
 by PN3PR01MB10378.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 00:27:11 +0000
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2e35:fc95:ee3:bf0f]) by PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2e35:fc95:ee3:bf0f%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 00:27:11 +0000
Message-ID:
 <PN6PR01MB1171716B896B7843E03469177FECCA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 12 Nov 2025 08:26:55 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Nov/12/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0345.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::6) To PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2f1::8)
X-Microsoft-Original-Message-ID:
 <023641fe-f736-49f8-bb2e-9bbd65c31381@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN6PR01MB11717:EE_|PN3PR01MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: 808202fd-1613-49a9-2e4f-08de2182340c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|23021999003|8060799015|19110799012|461199028|8022599003|22402599018|5072599009|6090799003|1602099012|13041999003|3412199025|4302099013|440099028|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bng0ejJyM2xkUVJURU95UUVoR1oxVGdRZE5KdEtpRlBxbTRZSEdObk1jZXND?=
 =?utf-8?B?SzlTN1R3ZU9QRmJaSk5PMkhZQWpwZTFxdHFUUldNYWxKVEdTelFWaXlCR0N6?=
 =?utf-8?B?NFJ3UURTbG1waU5uWlk1cG12dXluWTNhRFY3OUVKZXZnbVNSUmt6T2RDb2pa?=
 =?utf-8?B?dkFKbjBQdnRCMmV0RUlxclBLeGY2TTRxVFZkZ1JPVlJWbHVUOVJUU09IeTZD?=
 =?utf-8?B?a3JWalI4Z0JzbUJZQStOaVdGVUtrZEpFc2RIWWJvZUhnVU1WZUxmZ0t6Slhy?=
 =?utf-8?B?dG1HanhLMkpEcVp6NzdnWDE3alVadU1mR204b2NqSnFvdUc1Ylgwelc0Mk5O?=
 =?utf-8?B?L2ROUGgyQzIxaWxKbmFib0ZkaG5XaGVmNUhuVXpacVo0VUhwdHBhNWZjamk3?=
 =?utf-8?B?Z0ovOEJTcU5CZ0RlK3pFeGFUYjZPSzY0TVVBR0pBcmVoNXIrSzlPSmc0dmlo?=
 =?utf-8?B?Q0dEd0tZYkhTMi85a2UzWmRyNmVBTjlHRzZXc005cmJ4alFqRmlNdUJvVXBx?=
 =?utf-8?B?NDllT0hZNGJnNHVHOGRUbzdSZCtYYktFTWNjQUFsd1JKWXNpT3k3RUt5RXJo?=
 =?utf-8?B?d1VscnZqaDh2WlFpV3JUWkxLMGJxSUpoVXFIU2oveGZ1Y0N5a3VvVDZQaGti?=
 =?utf-8?B?dUhVQ1BoVzVKdzVXZnF1OGhiNDRxbU0wK2Q0ZWdmZWY1c0xlUkhDK1FKOFZq?=
 =?utf-8?B?dldCZHhkMElrYjBsLzNYaEc5S3NxT2NPN2d1Vm84M1VScEFTSlNQOTlKVUFE?=
 =?utf-8?B?RXpNclprZ213ckh5VDZDK3d1V1JFWjc3UVE2eC82WjlnWVBOdXhTYlF2TGlT?=
 =?utf-8?B?QTN3dnpvNmtwT3JpQzJEQXpDMWVwNzhKa1FXelFXVEFoSUtxL3lzUlJPUE40?=
 =?utf-8?B?eEZUUTAzZmpuWjZKNU5aQjRDMUVydEFmY3RxUW9td3RjNWorUUZDZWhwSzB3?=
 =?utf-8?B?MHJ6STU2dENNaHg0Qys2UmxQQVd0N1BlUjg0elBVMjZINnhndTFSWFJvMy9W?=
 =?utf-8?B?eWEyRFB2blYyRXdWa2dMTXZ4S0hQZ1dqSFNuY0gyYTlOdlBqalhhelhyUlYx?=
 =?utf-8?B?U2YrODBIR3hTaUc4QXU2QjgvVUxCb01heE5Hc1VyY2RxeG5GUUVlQWNGTmJK?=
 =?utf-8?B?bFBLNXJEMkhTaEt6YmRNY2ZUc0xZUElYM2lVRVZwdUJ5S2lsYllJcFRhWlht?=
 =?utf-8?B?OHdpMng3ZitlZFk0SklaNzl5cDZraGZiTzVZdytQdDViWlpSdGs0NnFpT09B?=
 =?utf-8?B?SEUwQzIwOHlTTGZvWUhDUXFyUVhVVHlLZVhWb1hteXI0MVdXRFNXVjBhUHhl?=
 =?utf-8?B?dVFPUWZsQzF3Um50ODhFZ3NROFRPYXhiQnNHZXBSWHlaL2orNkI1UzV3RXBl?=
 =?utf-8?B?MjhHNXNZd3hqZC9hVTB3eDhEMS9jclJQUEpmc3htaWdCRFVodmE5Z25rTVAx?=
 =?utf-8?B?K2ttZDFmeDRIMmkydjU1MkhlOFRZMWpFOG40N3VDV1FwZWNJREpWcVFwc0VT?=
 =?utf-8?B?eGE1ZWlQUU9IM0JITE5VcTdzUnd0K0lHd2dYSmV0ZlBVTEVXRERFSWRwbXlu?=
 =?utf-8?B?UnpUb2hIZzg3VmZnMjcwU0dwankrcTBPYVJQcHZGaTUzYkwvb2ZubG14aFFI?=
 =?utf-8?B?S2poVzZ5Qjl0MCtUYkR3bTcwaFpIMklUUm5lb3dIUW40ZDFCTHFobFdKWmtw?=
 =?utf-8?B?Q0lXb2drb2FZaGNOUnN5bTZTOW0zTWhpTVNxWUlwbExsNEkrbTZ6enhNako5?=
 =?utf-8?B?eXRJc2RmMjgwVmJRNEtLNFo5UFlQMmdNZDN5TGZJeVg1bTF2MndWTmFhYXB0?=
 =?utf-8?B?c2l2NVB6MTh5N0wrOTBRQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVIvcG9yOVI2UlhoUlZRY0lXcnNBOXc5cTEzR1JXdlVURFBQSDhLdVpiTWRr?=
 =?utf-8?B?RXV0dVptSC8zV29Fdy9JRW1zWmk4RkpabkFzN1BvR1RvY2h2RU4vK3Zmdzdo?=
 =?utf-8?B?eHZqSE9ObVBsMUw1bWM0S3AzYkxxOGNuSUJEZ1o2NkRpVVE4RDFJckd6UVJZ?=
 =?utf-8?B?VVd4Si9KWlpCcWRNUVBJYzdnbmN2TkRVMGJTZks5ZGJORi9tZitpdGFYbTha?=
 =?utf-8?B?OUwvajgxdWRTRmpLY0VNUEpPb1VLMmlyYW5aT2JoZFZJQlRkc0VWTmxNNjBL?=
 =?utf-8?B?dW9ha0tJNGNuVk1sNDV3QnZEM3JLOTdQTGNjRk5ELytLc2hUSmxlMUkyb0tH?=
 =?utf-8?B?aHQzUk1mK0NtaVBMR3ZuZWhBdjNpaUZXYWQ3azhlSWovUVd3QUloTXd3TURk?=
 =?utf-8?B?TmM1V2RRUzBwZGd6cE1uT3JaYzNLRi9aSUZPSzNiTWx5UFBLaGtJV1BMZElp?=
 =?utf-8?B?ZjBqTGJnaERoNEE3UkFMU1krUzBFWjMrUlhIWk5pT3dmZzFSTEJHN3lCRXE1?=
 =?utf-8?B?U2tpUW5lUjlBSktpN29GcU9nNkc5bTFEclpweFF5Yk00elVzNXlzMGgvdFFl?=
 =?utf-8?B?NmxLY0RvRzYwMmJGZVVRMTZRWDhDVVRuY1d6eS80MnFXY1I3enRHNXJMeGF2?=
 =?utf-8?B?SjF1bFdYRGNKSWhFKzVncVh3SGJkanROL0tKTHdSVFZxWU5sR0tkTmlKcEQw?=
 =?utf-8?B?SXpMd3FKRTJWNXZDTEJaTkZkenRyLzhtVjF1eFJ2NFhOTGZlcWlEZk5rVUVn?=
 =?utf-8?B?KzFVUlBXRXpKaVFScU9jTkFTK0RVazgxMGZlWmorWGFidEdnR3RWNGt0bWlO?=
 =?utf-8?B?T3VDSElmMFovYWJVOEhyQmIxSTBCRXFJWjQrVHBHak9aY21zMTF1WVI1YTVE?=
 =?utf-8?B?VVdhWmZzMEk3VllLc1NmOTNPZjAxM3A1a1BwRy8rWko0TWFaL00yencxOC9n?=
 =?utf-8?B?V0tWcXBLLzVOTmZwRDZNbGlCcEJwRXlUeVMxWDRWQ2tpbEdqbi8xNDJBL2oy?=
 =?utf-8?B?b0ZkVFFhdEsvNUpBT1k5YjZSMHJKL0JueldHcks5eXRiMngwOUZqZnd1cjMx?=
 =?utf-8?B?TFF0Sk1nOVgyNFVxNEVLdGRRYVFjeGJCUmF2L1hEOTB5SGtodmxkUW55dmho?=
 =?utf-8?B?ZmsxbVVQY1dFNkdiZXVHTGJ1am40b3BRNXJmOUpMRXVEckVsSEFlWmJ5Tjha?=
 =?utf-8?B?d1EyNGMvVWVFZUt5YnNZNjNLRCtaR3RDYjBtYlRmbVFsTTlZTmtZcVhIYVo5?=
 =?utf-8?B?SDNpb0hYbnRBdVc1cnhiMVVES2QwTUZqaGdYZVpmNHAwdVJRbFVpQ05VU3BX?=
 =?utf-8?B?a3FkUlZmVEpTL0YyLzN0eHlUS3RFM1hneWZRN1d0WmlWbXVUZktnRE53clo5?=
 =?utf-8?B?QUh6N3FiMWZzVVB6SW1BbUxYOXh1QkVheXhHTmE0QVFGMjQrRjM0dkNNM1VQ?=
 =?utf-8?B?Z0NoTWJJRDVRWWNQeUwyZ2dVWHpWUENxUmpCZHIyUWo2TnFCRHR1UHF6SHJu?=
 =?utf-8?B?UGhzWHQ1R3Q0akFVYjFWL0N6L3cvZW15U2Zud2JkNXZhck9JU1pFWkE1SDNE?=
 =?utf-8?B?UlY4Tjg0NS9HQmt4WGtQSHpFWlcwSzlBcTVScmQ0dUxEU1BlOWkydE1Vc2Ux?=
 =?utf-8?B?MkFvbFdQNmdPMnpHcGZFU0p5UFZMai85L05kaW1xdHZxQmxCK0U0MFUvNHdN?=
 =?utf-8?B?ZXpRSjYvMUhML3c2NDg4OVZDRVYzNk1ZZHF3d0JNZXE1RmtGMWwrV0I0a0h2?=
 =?utf-8?Q?x1Z4z7YIG3y0fwTPe+9mwie/OJu0XNgaCHmllP8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808202fd-1613-49a9-2e4f-08de2182340c
X-MS-Exchange-CrossTenant-AuthSource: PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 00:27:11.0298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB10378

Last updated: Nov/12/2025 @https://github.com/sophgo/linux/wiki


CV18XX
- Top syscon: updated to v5

SG2042
- PCIe DTS: Applied by sophgo/for-next, expected to be picked by 6.19.
- net: stmmac: dwmac-sophgo: Add phy interface filter: updated to v7

SG2044
- N/A

Thanks,

Chen

