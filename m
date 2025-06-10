Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011035.outbound.protection.outlook.com [52.103.68.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52950218AD4
	for <sophgo@lists.linux.dev>; Tue, 10 Jun 2025 04:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749528305; cv=fail; b=cSwQ7v0TriH+3QxIMtr5UxnqoyqgNsYyb6OgKigMXRUcZdNz0FrfnlAOjYWcTfTGAZa1YWQcuWEstWvOCutaGG2GhhPaF4u25/pCiOjgQBE+NwStK3pt1wexiG6rINXhZ+4h/sv9QyxdbrnxPHehGzJNSZfLTF6a62cl5Jat/n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749528305; c=relaxed/simple;
	bh=wb0zPVXPLOB1rYPDJvD8Xx+ZWjT/ykquUDrtxN4Shmw=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=kD/IS3TlFQOl9Ql/y4A8lqqBwznvfB3/ZBlWsikvUDooNEF4r/HON44OsQYc8/6aSAZ1dNDwLuo/IfC3pnYYrn7G/MMAjFV2kztvM3f4J2qeAfx/BOJYz+4BYOfQiG/ZeeylXR1Uyu98SNGA9ckjfO1DzHzoXjmLm6LjbctEexA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=QnrDlhOj; arc=fail smtp.client-ip=52.103.68.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="QnrDlhOj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjlNUqsevoAcvZvmCD6+mGAm837L+pjAq5piQcytUC76NQu0vnti0I4qzWUd2YVoqXYCpfISn4B0htSASGEZQbbNJSz1IBRHFCg8cVYfHePyF7yO+SH9k4IqV0IQIlwcF2wOfe2KLWnMhx9R5R5krqrlHDA1tL1bwN9A2wn+uYOnzIyb8Di4ZMwhSTM56kkJsauRspND1yt+c6aAoPbJlkdlr0Lhm+r/BFikCMsCYs0wYOjIlva5BEss5Ppufg+R24nWVGmCAAP2hprrREyCEFNOURJWWdJ9zNflRAOerKoZeiiAnCPzq4HHD01tjTzKFhxbJ9Fs5X91iIigwte3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNwf5VHyWujcAEZCX/EAVYcvGQyB8HAfAMBMFasOvqw=;
 b=yPuxkxCg6yA7wi7Lha83pr7Z7nR7WG2lDQARgUefUcV9o3bTEdGvbv7Mctsbe0Pjcur1nOHkaur63RwgMjJwgjhILntlidsaB8FlA+Jeu4HYNEaj+JQ7GsTmRIBDf22GG70fUQekH/v88MdixN4JlcsVudi2VapLdQRP2UpZFCmwV5trpOeifH0Y12KhqKvRtr2m+osOxisyXS29ZQ+evk80sTgnbVryw53Gib1q8MT5GyBgOBWfKr2A7cpygLAydKicwSsMoQzE0fRSufvXl5+4fPzCQvpYmkrmRbJuwAHpkISo02FlIVop7lTWfmOIqe12WoP+66oVYYWK5/2BMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNwf5VHyWujcAEZCX/EAVYcvGQyB8HAfAMBMFasOvqw=;
 b=QnrDlhOjhy7faVKkoPKTCxaV0r854fuZs4IU6hjHLIi+WBUdoYhUNZ/YOw8peZb4LH/mTB8OtT2iHjATPsL+SvirEQAdlHkwdLMFQAmyaKFlKn/tqn+3qfH8mbhaaQCtWxtWn9lzcBi9G9bvnHvjtL3/DvCSg11yeB9YQY9Pe4n4YNJYjQ2fPsznZQVGS52O2GwHfPInJND084Y9YNnV0NDeFKzuhXso04CSlFwyXToCmjjvthShTzlEoy8WaeWPEPh2c62uLSLuAT1dCbD7FJPKoJhQo4SE3rqo1jLozRzMzfbTFDUq01X8qHi21BJ2i9kvs779mu8c7dtGAqPIVg==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB1368.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 04:04:58 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:04:58 +0000
Message-ID:
 <MA0P287MB226264645A189531B6CA6951FE6AA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 10 Jun 2025 12:04:55 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jun/10/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0186.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::14) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <4385cba8-a2b4-4e32-9845-4a7225d452d7@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB1368:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da583ce-23c1-423c-e392-08dda7d3f723
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|7092599006|8060799009|15080799009|22402599018|19110799006|461199028|13041999003|440099028|4302099013|3412199025|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWQrRGovWU9tbE02Z0ppbjk5Z0V4NkxZbGJvMEZIUjMvYzQ1OEc5WDlicEw1?=
 =?utf-8?B?WGhlZTk1YlUza21tTFN2WmRBOXFNQWhqVGFOclZ3ZGRwWUQ3RnFXYmRLUURn?=
 =?utf-8?B?N0N5SU5XUGZmMldqd2FDc0x0c0Z1RmFDY2hDVGxNQVpBdlBFeEtwL1BUNkJz?=
 =?utf-8?B?RGRzanRNVjZDYXplb2oxK1hGaXNXVGJDTXVhVDFkckMvdnMxK1pUeUpjQ3U3?=
 =?utf-8?B?blYzbFFheTMrSFhTMkVkRFUxWW1NNDgwZ3p6UFduOHg1NWVBTm9OTXVhbW02?=
 =?utf-8?B?eDZhYnhmMlVXNWM3RndkaVlXN0d6a1FMNkpYUjNhdEhkVWErTDJuTFpOWEZz?=
 =?utf-8?B?d1FhYUFETk1kYXVRdTFRN3lSbVV2Yk5SMDJmdGNJMC9xZ2QrLzQ3OFFjNXNG?=
 =?utf-8?B?eEI0a2FncGdLQ2phUW1yZmMvN0xuVkdLUDEwZCtFNHE1OTE0VDNZTVp6bkw3?=
 =?utf-8?B?YytrdnZpUjNXK09QNEgzTk9rVVhxWjBldkx5clBucjFoeW9SVjVNd3YzeExh?=
 =?utf-8?B?R3QyVXgyMnpjSnBDU0RoTXR0SWtLVVR4R05BUUZyTkIrc2JHMEk4ODc1bys2?=
 =?utf-8?B?QjlCb08wOTR2a2JLTGJxNXRBbDllanVzRmhQeDJwZTJnYzc0RXZtdHN3RkhW?=
 =?utf-8?B?a3RDeXBUYWRrdnJsdUZHSzNmNUxmSnI1U3BBQzhrK1VJUFlFdWtiemtDOU9s?=
 =?utf-8?B?dDhtMkxVMXlkc0FQK05HUitCY1orTGdQb2d5bjVSZk81bkxlc0pDRmYwemMy?=
 =?utf-8?B?MmMyTC80M055d0hyUXNuQnFlU0QxSlVXZC9CUHpPZEJzZzBzb3E2Qllaclpp?=
 =?utf-8?B?VFpOMEhGa0c1YjBZQlBVNGwyRGtlNWZQdCs3M2VaazJGWGJWRkhVN01DbFNp?=
 =?utf-8?B?ak56UVh2L3BnSUM3ZURINEhTTzg3cmdVL0R1TC91SDlrRk5oenlKNmRjNlNt?=
 =?utf-8?B?VFJrczQwRVgrT0c5WEUyWWVwWmVzMGM5ZE85akQ3L2U0YldkS2h5SC84Slcx?=
 =?utf-8?B?YXBPcElRQnoyWUx3RW9Hc2ZLdy9QNFJOQUxqRE5rcmQ4WVFaKzBCSkd4QTNu?=
 =?utf-8?B?REt0VnVleTdxN1kyakZ4TTRmY01PZkNvQ04wUjlGcEc2QjJWS3QvYjhBMnIy?=
 =?utf-8?B?WXlKQk12ZkJpVFF2dGF0Nm5jYlVlSUVDTVRVeGkrc0lqeE8xdTJBNk44NHVw?=
 =?utf-8?B?VHVpT1duOXZmUGFMb2N3QUpkOUUzaDY3eEVScVF3RDRIUG9Dc2JROTY3Z3Fw?=
 =?utf-8?B?cTVDV29JUm1OMWpNWTJVaE9JdkM4RTRKN3NudG1NWFVyQ0JDNFFRbDFPRUdL?=
 =?utf-8?B?UmprM0tzN0M2aUQ2NkltczIrMnQ3N1UwdHlWajlVblhKVHlMRGNGQkNmNWZs?=
 =?utf-8?B?TlJxYThPTFIrUEVCR0VRd1FTelFRQVhGQlhqb3RGMmtPWkhwTTBmVnEvai9F?=
 =?utf-8?B?em9HeldWTWE1OEN3OGlCdGFXdm9wRHloaVgvYzU3UGxzeGhmSDVhNnBObDI5?=
 =?utf-8?B?ZmZPL3p1c20yNlJiWTd1K1Y5aUs4SFB0UFg0TUdTblRoeEtTd2s1VjJPZmlE?=
 =?utf-8?B?RXRTYUd5ZVlHRHl2aFNDOFErTFRpQmovVklLVkFoWkpPWE9PZTNHSnFSZVZD?=
 =?utf-8?B?SXdWQVhCZVVPZEphOTU5bEdYK0g5TjQwR09ic1pEdWdVcjN1ZzA3bUtZblJu?=
 =?utf-8?B?UXBYZTNxZ2JjLzZ0YlZHa0xrNmo5bXZ1K0RYQ2h0cDROQmhBYVpwNGRHOXRS?=
 =?utf-8?Q?yRv5jSngOGM8KK9Ixg=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUd6U0NEZHkyR01aL2Q4Ykkvd2Nydng3NS9aRjlBeDMzYk40WXRzQUZXZjY0?=
 =?utf-8?B?eU9ZT2N5ZVpSOGxQd3pBd0V3WU1FV3M5MFhkMEhsWkRsY0l4aE40Y1RXMzVM?=
 =?utf-8?B?S2R6MmZXNXNpQmswRm8zU2VieHpTemVVRjFCYW50aklKOHdQVi9qUEZYWFZy?=
 =?utf-8?B?dlFlOVVtQTRiMTBUZU8yamFXbithSVFlWGNhNWdiMlY1K242UC9TOVJ4Z2hV?=
 =?utf-8?B?VURURnVlNllzMUc5L29zdUs4VnRieFhCN2hqSVBjN0YwMXhxNis0VEFxT0NM?=
 =?utf-8?B?T1dNRmFNQ2NYMzk3cTJTdHFNYzNuNFhZZjBDMjdpZ1NUdm1idUVZelR4dUw0?=
 =?utf-8?B?STcrUUZhbEN3Qldna1FDdWQrbEdZSG10eFhyU01VUVJKYUU1Nlo2b0RPYUpP?=
 =?utf-8?B?dEV2R3hoc2tWN0JNK2ZwZENBOXE2LzlVOXRQdGJMVU9wOUpxMHZteDdIZHZv?=
 =?utf-8?B?cXg5bjV0a3FyUjZ1ejNad3BkU09QeVQ3NVAzUGZsSWJGTWFpZFlKWVhIRjhH?=
 =?utf-8?B?QldqaUkwZEFzNEhybksrRy9LZlRKSW51a09XQ3JXVStZR043c1J5cEJsN0o0?=
 =?utf-8?B?Vlp4a3JrdmV1N094TVRmYmpxeUtudnNxV2xTZmhIOFA0WWZvaENoYzhuREVX?=
 =?utf-8?B?Y2k5Z2RWUzZEc2lGcnZrYTMwUUJ4VTk3YjZ1V0pOVlIyc3kweUxNOTFhaFJW?=
 =?utf-8?B?amhSTW1zblV4MEcvckErb2pNOEE0YUlFTVlpOVZ5V2J1cmF0Y0RzWHVtU3gv?=
 =?utf-8?B?Rm5OQlluWit1S0J4MEp1emdVR3NORXUxNXpwekZqQjJhQTVsN2JJRGhNWERp?=
 =?utf-8?B?V1BjUVUvZHNDV01RREZxdmZEQzFDOC9LYzZWZGtONXVSZ3FFcXRGQWFJMjNR?=
 =?utf-8?B?WEpqdFFyVUthR1VZRk5DMm9ld3NwMUZFdHpSWlFwb0hIditIWVU5bXZwRjRP?=
 =?utf-8?B?OW5kNDlYYnM2RVVkU1FkRnZCUlRhM0ZXa3FYVWRZYWdEQWgvdFIwb2dDbUl2?=
 =?utf-8?B?RGozVzVtQUpiREZLTFBYc0J3cEVwQ1hMOVlzelMveUdkOVVrd0pQTk5pWHFz?=
 =?utf-8?B?UEU0ekhqcGFRN3lNa080QS8zWkRscUpzWEJCUXFGYVNSQWtYaU1RYUZ0VDNv?=
 =?utf-8?B?YnNITGltNzUwbFZNZTFQTGNnSFVWYWc2ZlRwTWVjcDRjazRPaVVVMkEwSW52?=
 =?utf-8?B?VG0vWkZJekhsK2ZYSkRBTkwwN0NEKzAxWXU4RlozVDBKSGRJbVY1Q0EreXlX?=
 =?utf-8?B?YU9jTzRKUWFqWnFxWnU4QWsyNjkwQytLd0V0K25kT0VLRGcyOWRuSHZGblF4?=
 =?utf-8?B?RXNYY3B4VVZ5Zk44Qm5BKzZIVnRYZURkbE5xa09aTTBkQ2xzeFJuQzRIY2M5?=
 =?utf-8?B?eDVTKzdDRk56R1V2VUhPdnJqT3VoR283Y1NyNWh2aGUvNW5WcXNlNHlDdWR1?=
 =?utf-8?B?d2dFcE1NM2VyL3FzaTNNc0x4LzBKWlBlTXlvS2tlQmhyNTlMR0pwc1JFNDlp?=
 =?utf-8?B?S202ZXpxYTYrZ1UzQWJrNHBiTWJlcy9mR29IY3d1MmtUcTJ6MXZ4U2RUdlA3?=
 =?utf-8?B?TWo5K2FjT0s0WGIrYVhCS1FiTUtxZkZQbFVnSVI2c25RcnJHT205UitONGw0?=
 =?utf-8?B?dmoyZGdHVDk2cTBCTFJobWdsaUdlaG1jeUYzSVZuUk1ldFArbXdabU45TGJz?=
 =?utf-8?B?VUZJY2FPajBqWXF4MG1tRzVwV2gyTUhMc3B4bTlONDBmSHpwNWxNZjJrYzh6?=
 =?utf-8?Q?6IZUNiXLvBWlVzZYkXifWZNpfBQryZVSbxNsyDU?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da583ce-23c1-423c-e392-08dda7d3f723
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:04:58.7141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1368

Diff:

https://github.com/sophgo/linux/wiki/Home/_compare/090ac548acb9c53e188e596bfa9148edc24f47e8...2ba3f7c2fd49fb02851b1e3131d69190b8142690

Last updated: Jun/10/2025 @https://github.com/sophgo/linux/wiki

Quick Summary:
- Updated with v6.16-rc1 released.
- CV18xx: Reset is updated to v2. See Alex submiited another reset 
patchset for SG2000, should we merge them two?
- CV18xx: remoteproc for C906L submitted v1.
- CV18xx: Duo Module 01 EVB updated to v6. It is based on the new 
reworked cv18xx dts.
- SG2044: Add more DTS nodes after clock is merged for SRD3-10 board.

Thanks,

Chen

