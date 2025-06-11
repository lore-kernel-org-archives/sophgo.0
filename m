Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011030.outbound.protection.outlook.com [52.103.67.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FF92576
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629923; cv=fail; b=CIRAu4F8m20mKTrxMiaa4C87ol+pd2Hh/BP/cq4ARznKJiFUOirNZseZaiMKfisNTYVsJI+nT+MV7928IGgIt/daZ1x/H/opkqlCoEMtA0RerqklsjLYG2/hz4HmS8ednwv6dHEclXa1GBtKrRZ28MNHNa3kQymmbjWTJ5v7vMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629923; c=relaxed/simple;
	bh=PplHuWl1RB8XxZ9rI8nSe0ZGD3XECv+8rx48Q73tAnI=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EzjzJVcTnWg7C0N8WxYJh+GM1q08NnHchzBBU7XChDtUFHvbBHSXQUAM9JxiS+l5flqrFEtD1cVYWoyE0RGxSeT4P5Vq+Ig8xxCxTN5SqzwA0UdYHabDFwgbIxAk9NaCRyX7GuNcrBUgLNb7i1EK+xzXP1Vml1eX69Xaq8HVb3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=kPoc3ivY; arc=fail smtp.client-ip=52.103.67.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="kPoc3ivY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEVanHN3h+v0PPbC3RzacINTlJXNO5MpoblnaN9OHjNUxl3ikPkOuezFX/rbOc24qn+/c5hAkUvViwMilINumY2wrbXz3x49YJhhUhfu06w4JhMpWTGr2ZUFc5LSbEpOQqkPZq9IdRwJ4B5XtIkLyK4OZu9NvrftDL542/akvZzEL6jKEiivNAubnjDVAHzNGZ4xOPrXjy/XsWxBszi0Is2FOiPtMOOIav5kv4IFf3h9uTItWJOd8IC62K0HUCGwx6CHkDmbCpaK20owVK33o3n0g1BUxP+W7rbcZqibuGo/UxmQTwQ1TXHrc6C7a6BSpQO8VkXqnG4/5ue20TkNog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5W/LQOoqOAIF5k0EGixt7wiVoCfA80AL8vCeC0igLw=;
 b=ZL26IKHaqYqxATW0d9njoEIl/SlORDsKQz+mS7mIANSY60GT5PXh2SGI2lqv3DVTnhVVWf9uWKFu3eiLwq8WooqGPGCvDLdwBgaoe5D6Oest2EV0NGEVfW+65Ottay758uxSJASgB4OMGp0YpPvwwQ5iSAHW8Sbc5FG4OxtBF8LxrJRbM/TLhXKndtx4GqJ12FR0qG//OjbcMPeDk1BNR1hq5vnDoxhVsQqzz4Q3aa5EKk/RssYJd2ZjVylMwXueYZFXcWzi31kkBdM+tMZcd+OpAbtcBZUCPGT7IGqYjXclalMB8CdqUXhT169ihrpwkMcBqfmNZRyld8LW4p9h3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5W/LQOoqOAIF5k0EGixt7wiVoCfA80AL8vCeC0igLw=;
 b=kPoc3ivYCF4jMpZF0Sic1knt3im3/06QM/NqPGIYPA8vNDZTl6t/lYMZDjyEhh9UECyrztk+Q7ONzi6YwL1k9B2RnA6buW+wVN9Wq5dx/En9bnQf2K1Qwqp9OWzPcTV424UJU6YXgcyInsshJ0E4CvIO2pLUhLMphXpMuBaurn5n72CxhQE2ZB0UwJPyXmwS44SWGvNdJo6tN4PeQkWjbUNqQj3WiIxZBWcUu+3/310b6fFClM4XVI83kALdQypwO9dM301TW5gsjvCVMTvQD67ZcqeWVOXTT0AEhwcvJy+erDxt334d+A6j1vsNKZT41NIwYlpZfMvpLC3iMNK6IA==
Received: from PN0P287MB2258.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c0::8)
 by PNXP287MB4246.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 08:18:37 +0000
Received: from PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
 ([fe80::b63f:e256:4db1:2e9f]) by PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
 ([fe80::b63f:e256:4db1:2e9f%6]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 08:18:37 +0000
Message-ID:
 <PN0P287MB22585E38A3B86857CCB1FA0EFE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 11 Jun 2025 16:18:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Linux Upstream Status updated: Jun/10/2025
From: Chen Wang <unicorn_wang@outlook.com>
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
References: <MA0P287MB226264645A189531B6CA6951FE6AA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB226264645A189531B6CA6951FE6AA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1c0::8)
X-Microsoft-Original-Message-ID:
 <84cbd481-c95b-45c7-a820-67b05478a02f@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2258:EE_|PNXP287MB4246:EE_
X-MS-Office365-Filtering-Correlation-Id: e05a4212-bec8-4c7d-2890-08dda8c0907b
X-MS-Exchange-SLBlob-MailProps:
	30ekHghIwFrdYz+DQATrmVRNXcCU+t6gVgzEa5E2DLT+BGVz3xUeQstNc5Z21GD8wv+vhz2gGTEN2qq1wSBVLsvBTwU6RrPENErOsDuyjvHsnf+NnLuX5oUE5kdH8K+LIKfD/riObovGIUiR3X0Skfr9YbT794bnFrDilI3f1hmyI6sIW5yJdyLQf07IyEWMJ5KLs4JZwaaY6niA2h4JqzMf0/+2VNiY/bSrO1wXRfYaeu+VoTkKzPOIle5Wuaugkgx3nXQABRTqpaZKkiIwDE9XMcWUm9uxJANVTHuBVkvVTzVxdlTaooCUM9GdmZfglb9nkbnj4A6C1gca6Y0Q7xGJjGnhFkfjrkIW+LjnUAaciR+XnTPMjjkqUMH1USWRA0ZWyXRX82W8QxZ3rRUgsyMwnZGE2INSF+xxTM86xC4/CZIJue/XyvzvNwjqRuFWZA1xlRFVGzZGTaDQd/jlldu/dYrgESjOAp6O8nUy6q0wuLbzg11OMjrPk0Z7+GQVle7ak03onxRobKlbV/rK97VCDCuP6oDteZRqfR4v1o5WmOlbvSB5J/o9Dss6ixRrz1i3AFTPl/IEA/+/kS61cjpHNqryrjmp7XZAG6PY2qG+wFlauiEikFe3UyKqVATeZjTow2iM0iHVw0+CWTiTknZ+Pew2rvycdG1kAq8l2xE1Rw+pe9KKXrKcf/qrZ+FBnYDpfHnYelOlphLEF9bEkrgOyT1kS3FOp3vLicRYYO5JsvON2giZKVEspZSv1zlJ
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|7092599006|5072599009|8060799009|15080799009|461199028|6090799003|19110799006|22402599018|13041999003|440099028|4302099013|3412199025|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTk0TEExRkQ4ZkFOUHQyMHR5YzQ1T1lpa0pDdVNsUmE0Z1RxOFR2VEduMkY1?=
 =?utf-8?B?ODNTWFVwL2RQWGlGNVZZb1FMUXF2a05KeWQycmZwZkFJRi9hcHB4TVVJL25o?=
 =?utf-8?B?MURUWnpOQjl4N3I1dFVHRjlvZHZrYUZjNnFEY3lNelVrd3BpLzU0Wkt6T3V0?=
 =?utf-8?B?KzU1NXlSZVZrR2hpeFZ0czJJUHFJRUVrd0p2ajhyRFBZNzF5MHI2UFc5T3Ry?=
 =?utf-8?B?UlI4eU12OVFubmZqZXpVeHdONWtLekx1ekZIcjExeEptOHFVL3VYbjZyZ05P?=
 =?utf-8?B?YSsya2g4dFQ3NXZZRHhYR2h1U1hxcWRTbDZzdzB2K3JVR09iUXdPT1ZQdGcx?=
 =?utf-8?B?dnFIUTVxMUV5S2xiTTUwNU8vdUVDRncvcS8zM2Zid2xFOEpWMm5NakZPV2hC?=
 =?utf-8?B?V3ptemMrWWJoU2pkdmE4UDYvaGdFcmhUMS9YUTlJMW45S0dpbzNOdVBZbmZz?=
 =?utf-8?B?dnZ5dGhxVTkwTGFGaHU1RkRiR2RQRW4wUU01TTI3Z05qaDZHeDhKQ1pjL01s?=
 =?utf-8?B?N3A1OHJhOTBxRVlqYkdoTm51VWZxdnY0Qm56a2EwamlMbDdIMVFHWXFaU1Rh?=
 =?utf-8?B?dDJsYVM0aU1TeCtmc3ZwcVl0aDBaSjlBcnoxT1dybUx1MUVia3paSEIrVnEv?=
 =?utf-8?B?NktqOEJ0d2hicXNtSkN5RHM1SVhocDdrbWh6L1ZRVS9JUFlPRHNXOXFQRFh2?=
 =?utf-8?B?SXpObndiZks3dElhb3RUR295VW5XRkRFMDBPcDhrUThoRWxnQjExT3dWcTlX?=
 =?utf-8?B?U1RCTEpoTGhLNkNDb05mVHVwOTJBaHlGR1RXbFVmV1lvQ0lqZkdOU1UwK0VV?=
 =?utf-8?B?QkUvNUdjNTlnN0wxWVZ1Q3BsWWFLTDh6UlZxZmZPclAvTTkyTzN0TXZDcUlr?=
 =?utf-8?B?elZ3VHY2NVhVcHJKRi9nTDhmekQ4Yk12U2dDRW9ROWw0S2NhenRHSm83by9C?=
 =?utf-8?B?SE5yY3NPZ0RmelhydWdsQnBvUG1KdlRLUTRhUlVya0hqdXFsOEtVUm9EdC9i?=
 =?utf-8?B?bmpzL3lwZk85N1J2WnJRbVpRQkQvQ0RlZTZIQllzRUZYT2tTZDNKSERJYkJ2?=
 =?utf-8?B?ZDZYUWtTdGNrRG1EZnRuN3NWR2QwbjIxRXRyVVVrWFpjQVY3c3A0RUNRQ1Jy?=
 =?utf-8?B?T2tCekh1eFRNVUF2TXZIbHgrZ3l6Q2dBS1Zzc25DS3hxVm0wemdNbmtVeGxX?=
 =?utf-8?B?emk2VjIxQWRNdDRKakE1eTg0ZVZDOENmR3NRZ3RhRzVQZGdLSWpyZjFHOFpB?=
 =?utf-8?B?WTNOdnlGRU03Q2lqN0MvbjRiemg2U2hNZVh2SDZ6OERaL0x1eU9HM2V0Q0xS?=
 =?utf-8?B?bkRkTmFJaXdVbm9KNnp1ZFJPUXA3dng3V2Nkb29IdG9ETE5iWDBwRVB6RlhU?=
 =?utf-8?B?OERoZGRxUFI4VDZzb0hKRFNML2x6VkhSSTFtU3pZTnhGamVhMjlkVG9QVHRw?=
 =?utf-8?B?V2ZaemM2OGUzbFgvdTBhTklrdEcrSHdQU1RlK0RNbjZsL2hBUjlkVUdtZ2RH?=
 =?utf-8?B?WkVBV3dIOTBCZHpKa1dnZUpHUFJaRk5NMytmZ1hXKzFQZkZvS3E2dmtSTnFw?=
 =?utf-8?B?ajY4ZEJwSUQxdjNpR3hHaHJYYUNyWUV1VFF3NHZWMVEyNGVMV2FwYWFXYVgw?=
 =?utf-8?B?cE9uakZsT3ZwbXU2ejRwMmp3Tlk3WCs2WXZ6OFljNFI2YzJ4Q1dORjAwZkFo?=
 =?utf-8?B?eERMSTFMYWNXcXZEZ2xQRzEzMjVwSEFWYXZrYnBFaGplNERoTG9EWDAyWGh6?=
 =?utf-8?Q?PyVN+hnytwrsbZLgiw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFZwaEY5Y0FoWmorSzkrcGIzOHlwTEdoVTZDL2FTSDdjTTJ6dW9vRGY1blov?=
 =?utf-8?B?ekN3b2VnQThOcVNaY2tyWWVlbGZ2d0lMUmNFZTlLdzZUdWNWb0d2Z2FFblRh?=
 =?utf-8?B?N3RUaCtUZS9RTk9vbVRnNEJPV2hBQkRnS244R1lTNVFWTUNsRlhJK1hEZXEr?=
 =?utf-8?B?QkRPWDdGTVE1Qndwclg4eXI3OEFlZE5RbHd6NVJWQTJQcUFuMHFGNGJIdTJP?=
 =?utf-8?B?YVdvN0VXYllHUXNmMlQ5MnE0SmxZZHN3RXZmTWZzc1phKzlXYkxSOGlrOEc4?=
 =?utf-8?B?YUhQbkRwS1ZjeFFNNkxIeHlYZ2xpWVNIR3Z6TDFXck5nZ0QydEJWYnVoNVZa?=
 =?utf-8?B?WS8wckh2cmkwWWRzRnZjRW5iTHdMdGFvK2kyY21ZandDb3Z5VkMzbXJ1cDI3?=
 =?utf-8?B?Smd0S2RFcnhBb2srTUd1WVJ0aGd4L0dEZ2pndTNJWFpzeDBSUnRkMmxJUEh6?=
 =?utf-8?B?TFpwNDM3ZjFtdm43ZlR2cUgvTlRud1hldXJhRVBKRHIreEIwZ1ByZHJ4N084?=
 =?utf-8?B?ajFaakVadVFFOEFEU2xLR041ZTV5b0RUOUxpanIwSW93U3g5SW1TSWQ5Q1Vh?=
 =?utf-8?B?ZjRvNWg5SkdaYTJCaUNLRlMzVnBTbzVicWtpMTZXVFJXMDE2MEY2ckk0bktw?=
 =?utf-8?B?bzR5V2ptMGExMERpa29mMkhlbEV6TE9wTkJOZXNvbDRhaWhzNk1yOStSU1Bk?=
 =?utf-8?B?Y1ZXUExVOE1MK0NVQXNNY24xWFZETDVtVTdQSkpBbnJDR0lHb0cvY241UU1u?=
 =?utf-8?B?RDBLNFlQSVFJVU5XOGUzSGJudVhzS3pPRm5xNk83SEJQOGZJbk9LL0h3Qmsv?=
 =?utf-8?B?c000eUZPdFVaZlVpbndrc3NoNEFvVnFDQldQV3M1L1JJdjg5bXJrTU1RZ3hI?=
 =?utf-8?B?eXJwaEFNOXlOQkVMY2kwOWREYkJrcjRhMU1DT1ljNXR6bU1IY3RGWWdUczNW?=
 =?utf-8?B?SG1yUGRqd3pUOG1HSzNhU0l4L2JzTnB2cmRpb1QwOUxKMGRXSUlTeUN6NDJM?=
 =?utf-8?B?Sm5wZURVamRoekplcmlIMWE4WitjOHZKY0k4ZEdNNUFrRXZXYTcrZXozeTVN?=
 =?utf-8?B?ZWxwZElaTnBJRjhScXJJWjJhbDZTNFZrRS9uVmhPWjI3VnR2YjhTNldSSERq?=
 =?utf-8?B?Wmd3SXBzSVlLVU5zTGFMb1dERXF3bDBQYk54djBGTXU2L045dkM4WVlnWnFu?=
 =?utf-8?B?S0VHU0lMR1hTUElFa3pobkIxRWd4dThSaHh2NUR4dWhNNEw3ZzZFc252aUFu?=
 =?utf-8?B?WGdjRVRRaVFXOXh6d2ROVzN4cTkrOUh5S0dXYnRFbE5YZHJ4VU1qcWtrZnc5?=
 =?utf-8?B?TzhWYjZaMmwxVklMZEJ2YlJIVDczT0tjUDdzMmkxSWVTQkVtL0JEeGtxcXk4?=
 =?utf-8?B?NE1kcWt6NTlXUHZNSEFYMWNtb2Q1bE1lanplSFFmd1VxTVZQbER1OFJrWlJm?=
 =?utf-8?B?UzRXWmdNSDdiLzRoOElZVWoyaGQ4c0pTeERISUhicUhWR1ZtcXBFd1VOSXpy?=
 =?utf-8?B?alQ4TXZmeXJON3E1dTFJd3NQNy9LR1RUbHZ1bzFtWitmd3RMcHRXYTRPSGlH?=
 =?utf-8?B?RkpkV1htb3UwZlRVd2Jjc0dpNnVTZmFtZTV1K2E5VkxDQ3FiTlQwZjI1SC9L?=
 =?utf-8?B?ZmhwR2VJeHV2TU9oblRpUlN1SXBPNVozcVdnSWI5WHVQeXFTRndlWkNhM2kr?=
 =?utf-8?B?U1JVVnZHQnpycklINUJGb0M5aUZHcDdiTWhhNC81L2pPYjlncmdheHN6M2Fw?=
 =?utf-8?Q?M5a4KOOX0NRenfwH8UvtFSpxmivNDpKi0lMQ3lM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05a4212-bec8-4c7d-2890-08dda8c0907b
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2258.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 08:18:37.1685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4246

Updated,

Mailbox driver for cv18xx is also acccepted and merged into v6.16.

Thanks,

Chen

On 2025/6/10 12:04, Chen Wang wrote:
> Diff:
>
> https://github.com/sophgo/linux/wiki/Home/_compare/090ac548acb9c53e188e596bfa9148edc24f47e8...2ba3f7c2fd49fb02851b1e3131d69190b8142690 
>
>
> Last updated: Jun/10/2025 @https://github.com/sophgo/linux/wiki
>
> Quick Summary:
> - Updated with v6.16-rc1 released.
> - CV18xx: Reset is updated to v2. See Alex submiited another reset 
> patchset for SG2000, should we merge them two?
> - CV18xx: remoteproc for C906L submitted v1.
> - CV18xx: Duo Module 01 EVB updated to v6. It is based on the new 
> reworked cv18xx dts.
> - SG2044: Add more DTS nodes after clock is merged for SRD3-10 board.
>
> Thanks,
>
> Chen
>
