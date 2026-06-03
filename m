Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010013.outbound.protection.outlook.com [52.103.67.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B013134CF
	for <sophgo@lists.linux.dev>; Wed,  3 Jun 2026 06:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468291; cv=fail; b=LeZovVwCACEbV29kq/nW9KNRaCtCoIu6A+5xEIk9thFlAjEK5XQhgXRubKK9uRNe4khbcwEBuJs+lB1cTwzU/uf7o50bteUZbDGOTJl2C4lN55gstWcms58n+n4quqZY7dmjMsjNSWiRzJpD1ta9x1dZ1yxo4/qfK/3FwI3oWMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468291; c=relaxed/simple;
	bh=dH91rsmPG2Xj1ymez0ZoHzAT6BYI1TPaz+vLrzvP3uE=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=qPHdV4SrGldd86zaWa0S1UluGJeAsy3X6jrUFTbbe1nAVil7cqnK3/o4HQSdKFLHuDkiNdJXSaAKwsDCr1AjiCTSc16qvQe6RBYADeicn0Cz3ooAZ50zTgycEnYHGODzuB1mLB4jgLCQQwUUOieu8OZDCRRXIQGNq/MOrBO6k5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=hEFtgEom; arc=fail smtp.client-ip=52.103.67.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="hEFtgEom"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5PGDhCJvV6FGAkdqtAngYK7boB6uyPjVsY6ft4EsiO6R6DNJgd7XjU/q6E2DDU3ag4b2cIXFTJid0ixaEHxxQXa5yKNxW/LryEJ5B7mZ8CyQC0xBrZyErypI2rcEOTMUs2ZNHqLSZBQr0yk/UiPZAgdvjDQH4cx3Lu03Vlrou/xHBB0YUgTtb9Berpl5P7V1ZEPKUAAHYWrUEjiZsFGJCxDLgmZhj2VmMTHBu8WGsYR6cV1LWxi75EHwGOOXgAVRc/7VXSku12fZrhaWIhqCiDQa6rv0xafd7deD1AKOSTKcsf27/z+5Tb0X3ev3neskDiXdu8ki9lWEyybD+zhNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ppw6N0oxEP2Q80vXumNeKFwZFha/dPOOg5EdR7xqNGI=;
 b=IrO1yhkPu1ZRGw3cRHOWTELKOeIEiPALqMlzqWWhqWtX0j7NVgXgb72u4ZSRISJn6YuGLYaRXwS8tIFxn4vVJtCV9BAM+8hIhInNJu1ut6HjsAYp9kuCud7VM/BzHRzWnM0foBfEvG3ygNFgtJYYhQlMDpABlV4J4/xOXc9Sxwjed8kg3QfF9qqqJphX21gBCeDLxKbGxk+DjSPXnjSREVGhtSIYiEOnccJAbReZn7lhPXqJYiTxwT/Js4eErORtG/G9dVtYrj93PXivg7r3jzJHhq0ABwI2ssA+5Xxb0WF8gEJvKP1bgvcTy38nSfXbnL8ytIqev7tMlRvbnVt+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ppw6N0oxEP2Q80vXumNeKFwZFha/dPOOg5EdR7xqNGI=;
 b=hEFtgEomP+QGTd1xd7jLo+EuLJTKLRBc171cHJXQXvxCx4+2n87Uk2e7Z6b95ePCOgtuiHnta0YDgrD8Ht2l0F9v6nr/LkhjvFlQUMeKstHdCqtqPzhVUAV1YOf3UfXOPpQv1LAJh+1jUWIv/Il3JjtRosFsbEuTpXX0gk2HL7AaBnBY8uVLrCG9OorjXNV/qU/9Mo6Tf35Q90tQ4S3QgzYPyIS7/U5j4mHW7T037Wq/Frly27/kPRYejIrjhp8M6Klm1KlwNTR2VqWHGl457BEuJCZaUFowkwmnwy4m6eFwgeDSvC8W09TxqdTQCtfaZSZj8K4g+29UVTSzP0bZ/A==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PNZPR01MB12575.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:29d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:31:25 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 06:31:24 +0000
Message-ID:
 <MA5PR01MB12500D65FD3907037BC04F481FE132@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 3 Jun 2026 14:31:21 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jun/03/2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <05c3af38-4dbe-46da-9920-21a3c164c0aa@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PNZPR01MB12575:EE_
X-MS-Office365-Filtering-Correlation-Id: f34cb146-0842-400f-6d09-08dec139bc0e
X-MS-Exchange-SLBlob-MailProps:
	CLk2x5OX5VamqICzye+310VZ145p/ghudRTbiZa1FHgG6V1ubnnqrdf6qu8kJ0j7oYImE8dWodSawiwjQDskQbOvpRvlePkapNXxWAuWupO5dWSmSW76p3ba5BvjBDcQAKbiQRT7ELeUrx8rzWryybv0ziXAGW3xLsFxAi7oTod1PwyRzy0sM4QLAECbETQ1h2BCdHGc0+SH/OPwdedik2yCk0ilKdSKNmmIgmrMTRGrlFLctsHIyz+fBbjpsmFqEEYOAv6VGHCHa84YubSay+nfzoM4ZgwJKZSbTBjsAttWuC70bV6Iy1KTb8AvvfLKZTBtVVBoRoXilDx49txjuKXqx+h1VrzGELz1RXgdq/mEvP5IIGLHYBDHZIdhLykIu3uZnhwTfY7kf41fSN9DjWpBNtH4G2ZE8eIOY6EBvJAf5ptJMKgHQ87+ywPMPr7OvgGnyfy481m6EFa5a57/R8KBEGGTr2RcT2vZcchUrlkB4+tOC+gNRTlRFBH9mgQtrAIk1c/Rvht9sQNYhytYCqiMh+Mi9k5tumbAp0Hph1PHe4DzTPj6FQH86hpkZRWlBDSgQqDvpm+n2ITTHfIQ/NyNY66Hc6o+nyXsP/qZbZzgE0ETX+wtvuCFFy7TmTAt/if0E3CFiF65mONPfTIefCpusCWRD4s7Oi39rL8QUxB8UhtBO93SHKQ2U+Yaj+WDFe7EiUvOAqSVd1uYgEjmow==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|24021099003|22402599018|25031999004|24121999003|39105399006|41001999006|20031999006|22091999003|19110799012|8060799015|6090799003|15080799012|24071999003|23021999003|40105399003|1602099012|3412199025|4302099013|440099028|10035399007|25131999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDNCTXZhaG1KaEdnbVJCNGNOMGRiU05tWmFjbjlOQWt1Um5ORm4zT0FjbE5o?=
 =?utf-8?B?ZEFDNytLOXFjcXl3dFVET3l0VWluRHpIYllLNFNIMUFRS0VQbE1tUitRVGU5?=
 =?utf-8?B?SE1NWUxaS1NnM1pmUGtQU0kyY2ZHWFh3WHFhV1c3UEFSOHZ5T05pQjB5MWlF?=
 =?utf-8?B?TE1Hd3hkb0h6c0p6OGk4cGQvS0ZKcnBaeGNnM3Q1NlhCNGlLeXJJbzI0ajln?=
 =?utf-8?B?N2NkTlFsQzczOHhrb3VzSldvZm12Ym9yUGN4OVBBek9jaW1CdWdvaDZCYkpw?=
 =?utf-8?B?VVloQXkvQmJUUkNtdHRyc2hOSFZvVFFYTzJGRmErK29NSXI2SlBabVZWQ3VI?=
 =?utf-8?B?c3czMVBiSXNnYjJkaHRlR3l2WTBoZHorZnBscXdXd2JtSXFxQmJjSmNocVpH?=
 =?utf-8?B?WStsTUQ0L1kzbzNUc2JzeVlYYnRYTlp5Vkg1Uzk2OXBDTHZIQm5zcXh1VWN0?=
 =?utf-8?B?c0l3a3NkYkthVkpFQTRlbnVtNi85d1pRbktMTkZQM0d3VjRzckt5eEJINGtF?=
 =?utf-8?B?N0VhYXhkTERDdUYrY1lscHpESHlnVkIweUZSZHA5ZGlSOEw3cWJYSTNsaFFj?=
 =?utf-8?B?cXdPUXJUMUhVZVV2Si9XTDhsOUhQc0hNR2s3S2w2S0pZN2NRVlRWRk4zbzUz?=
 =?utf-8?B?TUo5Qnp1UkdRdVprenRiZlFDWkkydkhyYW5DY2V6TEhTanpjbHg3WkJDSDQ0?=
 =?utf-8?B?R043RDFPbW1tZXp1NTdic3FudDBHOWt1eDBsSm9rNE1qMStJVCt4VHFZQ0xp?=
 =?utf-8?B?TW1PSmxHMlRsaUlvMGxCK2RDWVBVUmdCRCtNSk8vUnUvMXRYb3JCdWZ6czRh?=
 =?utf-8?B?Rnp3c3dsVTRaVld4dXlWZ3hzd1VmbjRsRHFlcktqSDNqZWRQL09kTzM2SnVY?=
 =?utf-8?B?bk42SlJEbFdDbmdUbVFLeWY4ZmVpNTV2Y3lXSWxDQXNzU3V1YmNDWXhNSjZr?=
 =?utf-8?B?NXBxL1YwbzA5VWhpbFF0QklhNHdYL1dodUw3RjRYc1lqZTR2aEh1TWV6OGVy?=
 =?utf-8?B?VUROa2Z6elZCSE95QVNQWlpqNzZueUt1TGlvd0d4VjZOQWRJOEMyZGhCcHE4?=
 =?utf-8?B?WXVpdUh3WWx3YzlKL0M5M1FpQU1Kc0pwaUlCdmJDRDRMcnQ2alJydmZrMVdD?=
 =?utf-8?B?SXdyb0x0MGFtaTZuY1k3YjNnR1NFdTdpeVVxZUlSSHAvamFWaDVTd1BHeHVZ?=
 =?utf-8?B?RTBjb0Jrb0kxQ3M1T2E4aFRPVE5uVlRtZURyZjdkVlRqMytZLy9rRGhHeVdo?=
 =?utf-8?B?RUVGeDJSUVVhZjBEZnVGRFVmd3FHUldkWFVFM2FJUVpVYkZydEpqMHRtbVBK?=
 =?utf-8?B?b2Q1SGlGMjc2NkthYTVaUHR4bUZ3Q1dLWnBERkdndUpQMElKSnBoZ3FuL3pJ?=
 =?utf-8?B?QWsyQWhmOFQzeU1YdWJ2b2dkMllyU3RhdW03OXd5aEx5TldSa0ZsN1ZCU0p4?=
 =?utf-8?B?QWJ4VnVFWVdrZS9NWXN1OURSd084TVNCanFMc3Y4MThsclB2M2ZoMlRqeFlz?=
 =?utf-8?B?cnJDSkRyekVpOVpRTy81bjE3U09Ea1NkSG00d2hwanhxVlZYaEtkemNNb2Mv?=
 =?utf-8?B?U3R3K2pLS2IzY285Qm90SFV2aWllVmRYUnVRVEJxb09xc3V1YlFvdUVCNG1N?=
 =?utf-8?B?T04raVBWbExkUXM1Yi9ETjVrQmV2YzR0b3RiYVM3NTRuKzNXam5NaXVQQ3I0?=
 =?utf-8?B?eXVCWjNWdDh3amZUaEE1c3p0NEZLaUppS3FvblIxT3VDTjZ0NjN2SGR3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDFBK0JUTmlEbThxNzh6WjNKREkzRzQwZytGNkQ4aWZjRmt0OGRvR081VjdI?=
 =?utf-8?B?ZmVXb1FEdUlZaVRlZHFMb0VyRklCTS94a0d5WUpCMHcxL3NoSThmWDJWTWJI?=
 =?utf-8?B?RVVHYzh3UlpaM09TRFhSZGVOZ1pkMVJzUHpNc0phOXgwajBPMGtBTjlaOUhz?=
 =?utf-8?B?OXl5QlpzMGd2TldmRUh1TUR5dnc2Y1cxbWFPK1JobFVFVEFnUVMyZ25HUDNZ?=
 =?utf-8?B?dloxRDhaZDdKZmNGT2QreWpVN1hrM2QyejJCUUZOK0pGUTNYdTlGaC94ZEdS?=
 =?utf-8?B?NkEyUDU5MXNZK0s2cUhBbHE2Z3B2RmhRV2h0WWMyaXhGV1JVUWJsblBCODVi?=
 =?utf-8?B?cURkTkg0SmR2dGk4OTJ6RXZhSDNMN2FxM0FEc1NUMTZmaHEzL052dDhaQ1p5?=
 =?utf-8?B?R2VwZ21RWlFBS0RBaUxWUmlPZmhyRDFwcDQ2Ly9tMGFWeG9pdXR0VE5GZTJj?=
 =?utf-8?B?Y1U4c2NLYTVIVG91dVJ2QVc0eG96SjQwVGhaYzd6S2laTW5YUmR4aVZVcE9u?=
 =?utf-8?B?bWI1aldkZ2pUaTRiNStOSW5aMnczZUpMZXlLMVpLQnFYOFpDbVAyYlZvVS9Z?=
 =?utf-8?B?Z3BzR2xnTHo2VklnTTRXRkVjSnRYbitkbWR1WUl5cllUNnZ6M0g1TktIMXlz?=
 =?utf-8?B?MkwwelNlMjl5NzM1YjBSOVpyOGNCa2ZiYnFsQjFBWGhrZ1dZRTBvMWFGdHZZ?=
 =?utf-8?B?TlExOW02ODI0c2ZYTE0xN1BtaHNKTXlpZHgwR2k1aURjckx5RjJJdG9OTXZT?=
 =?utf-8?B?SXp1UjMrMVZXa09BQzJLNnBLYU94MVRjMHRvTVFEN1ZxM0tDbjBNN3c5c3Uw?=
 =?utf-8?B?aGRhNEwyR1h1Uk1xVklKWWk1a2RLcll2YTdNZ0JrZWgrQVRnUG5XUCtxWEwv?=
 =?utf-8?B?VGVONXdMVFl6cnh3cU42NHBBRXp6QU9iTzAzR1V0c3MxMmdsNGVYSGg2alRw?=
 =?utf-8?B?VWtOeWFpdlNabk5tL2hTNGs2aVZhN1IvME9LeFdzTm9MTVRWOTZrb0VTSUxO?=
 =?utf-8?B?V1lBUGUxZjQwcXNPelFhdWQrVXNaSXhkdGtnd2FpcmNyMFdKaU90UktXR3Zp?=
 =?utf-8?B?elphcS9PcnhxZnRtM2Nxb2czZjdxZHF3K1c2bnFjZnUxWjdBVUZ0T0hFWjYy?=
 =?utf-8?B?ZTRYL1JwbFlWZGJKVnR3a3hEVXRDOEpSR0RaOXJjVDV4Mm1YSFpkT1dJZmUv?=
 =?utf-8?B?eHdEQTdHMEp2L0pqQXI3enBqOWRCRU1saU9jQlJYTDN6UnUzTlN0S0dLWVJJ?=
 =?utf-8?B?dnA4ei9IOWdnclRTZSs4OXFvbjZobCtiQXk4R1hCZkM1NHdPOG1kTFhzZ3lZ?=
 =?utf-8?B?dyt1Y2JSelpFZlVjdFdKeHcrQ2UwdFlkN1ZmQmIvQ0puTVZKZE9Ca1hFazlD?=
 =?utf-8?B?Q3ZyeE5DcjR4Z1laTkVPZmYwb2ZicE44QitQWThYck8yMXZMbVBtR2NYU2tE?=
 =?utf-8?B?Zjc5bDVpWlNmWnUrWTVhVi9kMmlxeUhKaWU0RThtQmNhK2tKK3l4T24vUmdj?=
 =?utf-8?B?ZU5rb0loeFJpWTJQZFB4TUNJYzViUFBQRW9xb21BR3N4Q2pIMm5JQmovcGtP?=
 =?utf-8?B?cXJPY2lYUXN4VHFad2lGdXlqSDFlUDM3VkFYU2NjK2J6Y1hoVUthQ2REQWc5?=
 =?utf-8?B?K3pITzdwMDZ3M3l4aUpVL2ErL1k4Nk1oOEF3RHN5TmRVTC9sTm55NUwrc1pQ?=
 =?utf-8?B?N05KZWJ0TVZlSkhNZVNoMHRZbFB2NWNOV2M0eFYza1VoajJzRU82eDBhSEpV?=
 =?utf-8?B?SHpJUFNOZXE3Ym5pNU45MkVKVURQbDNiQjZSK3MxeXJscExUTVdvT3Axa3o2?=
 =?utf-8?B?R0NDbEU2Z0o5YmtkdHZlTzh4RXFXYUlRNldmMEcrQkcrN0N3Z2NHbGNBRGFa?=
 =?utf-8?B?S0RDMWNuTUZWVDBtbEFsSm82cGJSMzBNRWJBMTRteXBqOHRWTzIzOWQybVBq?=
 =?utf-8?Q?Qt+xqn2NQ95RNk5xgIzNStWbB170aejO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f34cb146-0842-400f-6d09-08dec139bc0e
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:31:24.8489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB12575

Linux Upstream Status updated: Jun/03/2026 
@https://github.com/sophgo/linux/wiki

CV18xx:
- Allow DMA multiplexer set channel number for DMA controller: when PR 
due to not compatible with old code. Continue revising to v6.
- Duo S support: Bindings part have been applied on sophgo/for-next, 
expected to be in v7.2, others are still need improving.

SG2042:
- Enable PCIe DMA coherence: Applied on sophgo/for-next, expected to see 
in v7.2.
- Fix CPU unit address: Picked by sophgo/for-next, expected to be in v7.2.
- reduce SG2042 MSI count to 16: Picked by sophgo/for-next, expected to 
be in v7.2.

SG2044:
- Fix CPU unit address: Picked by sophgo/for-next, expected to be in v7.2.

Thanks,

Chen



