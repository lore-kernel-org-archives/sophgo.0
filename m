Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011039.outbound.protection.outlook.com [52.103.67.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E647221B9F0
	for <sophgo@lists.linux.dev>; Mon, 14 Jul 2025 06:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752473629; cv=fail; b=oHwHzxvZMOMUJakfBikual6WB5uTaM9DgqxsqCRMCvMA781SyZHAJ5NO6kZNwukgFu9E87Uu8EUS/3Ps7x0BN8u26vQuzDQ4BHClaZ5t4j9zqhrAIp3IRtSywKnLFjoHe2UfpXrOycb9RkTRftBJmkxJ6Dtf1gFObq+bcfGAqdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752473629; c=relaxed/simple;
	bh=mKNkf0n3OLLOCPMlDbrKLWNubJEeoYA+vu5TM9L+b28=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=aVLbXZWz7hjgGaCJmQJBtRBI1RDZDlOrl8SO8G6w+qtO2IGGgqBep27BYZ7Wl7G0pbI1Y+lzxIahEq4KlSkUYqqqlgTrFi8ak5zXxXzyjWc1xmbT23Kpo6cJAKxiLHb5nO2Zo+lJrGbZIaDBsOTAL0gJNSnZ8xS0zIqnEPjPu/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=kVIL8LNp; arc=fail smtp.client-ip=52.103.67.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="kVIL8LNp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHjm0kKFIQzUsFW119aisEjuXKi4HDYYK46vJlyzu2a4L6ujw7S6DJj4dw/hFZxLe358bIZMwWUkblGrRgL+1nYYCNABbmrojl8HciwsGsXB+6AhdBzO32pQjGraDqM8P/CAZpvbF0MTebk0tlvl4g3qn2+Z/RD5Y+yfFOHAt6CmC5kPeb08x7drpMnKZA8Z9pM/i+oIlW926JuBjfV6iybxVK+V/Tu3vcBYzTNQltKrKkz6n8AkCTVd8uw2FBQtHyAXaIrLJz5inRlj6buDwPUBgoJ6DOpgZ7TjMV+3ngy77qXOhf1sJnVKIDk7JN1lWr5x5hiwvNfNzsQl1zGnEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xe4Xp46AWrq+rDBT/6kTo1Mt/54aJ1Y6YUdQmdHIlY=;
 b=RHAAV6MpoN3tpFXaA39JKiJLm1g6EpMqnWR+7OQk+QleUdUyHlS7nFQv7+FQHqKhYViSlNdHfpPD+wED0+jyTP3IRSYb5wDbf6ITo/qd1PUnhJOcOog/EuktdU+xbQDnjbAQFdWUgYqRZiK1O32rEZTdV8Mp9XGlS2kLeh22WY/OJ+GX71BC8wwxh4kZ0lwcA3ADi1JeoPHvIyIRdmfLhEIhlFFe+h6ylhZ/3s+sgEscKyjo3mav8pjPUzEg/CxO6PjnAyZ+beSq0c5Kl1ey1ORaRZEMKKxNCfVQXKId6you0nMYFV6jrVWaGHkYdgj20EDdf/9uYdlrMtkw1H17UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xe4Xp46AWrq+rDBT/6kTo1Mt/54aJ1Y6YUdQmdHIlY=;
 b=kVIL8LNpRT6UpNIZ/qoEJ5eAKkFyC26e6AxZ+EHxFFVuAWnullPei520IihWMFNis74oyKhkc8i7ANZltbI6NtxHeprK/GOZrByUNWm4zgDNO5AZeWtNHfMrZmGGQDpREhsppWqMUx0m+wfv2mN0C9PzTQn+F6QBAu9goEq0vldQGE1szxF9TE/9XDFhTrIRGGMv3dTR9DFGiM5iYSgBqEmpk8246F7eFXhnNMv799XF6ZjwhXhiOjBOuUVX8MkNbZBXEMp4buM7s0H22lrWBsnsSB6z3mFUj1As0aLUvYu+LYJmdGltQcMhN8CGQ129bcyX2iMI86f0J/aMhgzjGw==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by MAZPR01MB9063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:10f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 06:13:44 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 06:13:44 +0000
Message-ID:
 <MAUPR01MB11072DB4EFA1DACBE6E94A2D9FE54A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 14 Jul 2025 14:13:41 +0800
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Linux Upstream Status updated: Jul/14/2025
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0084.apcprd02.prod.outlook.com
 (2603:1096:4:90::24) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID:
 <626ab21f-d299-4760-aed1-d4ed65b4b609@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|MAZPR01MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: 114ffe1f-4390-4040-112e-08ddc29d95c6
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5062599005|6090799003|461199028|22402599018|5072599009|15080799012|13041999003|440099028|40105399003|4302099013|3412199025|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OG9jcjk2UEwvWlFiZnZqcWRzYnZvZEVEOEk0dGNlcm5vOXN3UFhLK2NPaWhM?=
 =?utf-8?B?Q2VGdzUzSFphWFNBSG1NL0lKWW5PcUVoVlFiREdlMURJK2M5eDRtQ1UwU2RY?=
 =?utf-8?B?bUlvTk92Z05nYWFoay96VjJmZFh4aGxzTVVZeWNEcHMySERMTDZCbHVUSTA4?=
 =?utf-8?B?ME81VmdCWm9rRi8yZDArdDg1OHk1UDViOEh3bHgwN0tpbXEzNldpdFFpbnVO?=
 =?utf-8?B?UU9Tb05DbVl2Z3dPM3plMFlYMk1VMnV5TzJCRm1wckdlSXFIcXYrUVFjcXRk?=
 =?utf-8?B?MlNKc1pwb29Ub291Q0RMWHR1V2tGeHlmUXdTVk1CWkh6VFdSZS9JZjJsVzR6?=
 =?utf-8?B?YlRDajN0RWl1SGM2VXZDUmZxWWI5N0U1SisxZ1JPU3lBNitQSWJ4VW1QRkh1?=
 =?utf-8?B?NnRIdWhwai8rU28vNkNJS1JqMUZnT1ovQm0wNFAwMFlRY0IxNTJqSWl3TXp0?=
 =?utf-8?B?NnpHWElYbHNNUjJ0NUNqUXdKMVhTeUwxMlJjeFlSejkxdW80QjAvTnJvdGFF?=
 =?utf-8?B?NkNnbytmTG9ybTI1akFNMFIrVnFLMER3SG9USFM3TExOWnQ1ODQ1ZnZld0Z5?=
 =?utf-8?B?anlSRHBWckh4MTBQZ0dycU14b0Y1WTJ2MHRKYnNZSkxXajdJSHgwT1hnbGs4?=
 =?utf-8?B?UnpXMmZFNUxENXhPNmI0emlQRzN3TmNITi9sd09hOG9VcWx5TzdUTmhpZHBW?=
 =?utf-8?B?WG5ibDZ4VzA2d3BIUnV5bnRtMjRBY2ozeUVTeG5TNXZ3VU5jM1BsN05sZGlM?=
 =?utf-8?B?K3RHNEVYT294Z0JTMU5QT2t0enJ0MjN1NXdCZVByaEpaUStLUHV5L21Dd0tq?=
 =?utf-8?B?ZWxrejhSOTNsV09FR0IzbnFudjd1VWt2RlBFOURvU0I0aythTjA3MXN0bVgx?=
 =?utf-8?B?cndDRGtBNFRubGRhNDltTGJZV3duREJrV25vaGZFODMyQnlFVnBEWjcrM0Jp?=
 =?utf-8?B?VFNkOUxtNXdyLzdTWFVaSVBEWFVVUWQwMWt1cDFsT1dMWjZRZjFhb1ZISktx?=
 =?utf-8?B?TldWcmkxRlJNbVpueFRVajgzZzU2cGZmUzNLNm5MQ0dqL3FpdDF6NWJXWHhP?=
 =?utf-8?B?SHloczAwSkMyN2xCbXlwUEFsN0lZK1N4Vkp4SzdCT1lQZENRWHBFY0xjQXEw?=
 =?utf-8?B?c0FzdmptNnl6QjhWU0Y0VDl6eGJjNExFZmhUT25sb1Q4eFRaa0NDTmVvS3k0?=
 =?utf-8?B?eDQ4cUdFVHIvdE8xM0VKL2oxOHlmcUdDcmw5UjdGUGJGN01tTVhmMHJzdzJj?=
 =?utf-8?B?WHM0Y0t4MDU4WTVHdDhIVnRsdG1nMG1QS0FXeGFOYlJxaVdQNU11MDNETkx4?=
 =?utf-8?B?THZnV0ZUVWJnZk1EaWVBbVJ2TmlsdjdEeHBCc3F4Z0hOd2VycVphc3Vhakcr?=
 =?utf-8?B?eUdaT2tuR3BWZGJodkkzZXdkbTJUOVZJQkh5NUlsNXg3ZHBURUNKTzJ3Smsw?=
 =?utf-8?B?NVVQK1l0S2dSemtXcTh5TzU0djlZdlQzRDV1V2xZM3JiWWd2YndIMk0vZWwy?=
 =?utf-8?B?UGVreUNNYmYzV0VZV2J1SGY2V0NLTE4rZGxRRUkzZGhPMjVkUkh3OW9tKzBE?=
 =?utf-8?B?aCtWN3h4SG5mSXk5UjZGaDY0TU9EQmVzb011MkhWamd1Z1NYRVJ3a2VDdGQz?=
 =?utf-8?Q?0WhVH9ix0IYFdaMmw2T2qXZYQAptFfZYovnyOe5txxrk=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1JoWU1SK2srQ3NxQWp2TjluTWVJNThveWpCQXhyZ1FHcTlzTG1hTndhZTE3?=
 =?utf-8?B?cUxOd1BKalpEQ043WHE5djdFakFTWDd4NUQvTVB1MTZOUWU5ZjhSd0pqMU4y?=
 =?utf-8?B?R2hxM0FVR1lZQk5rZXc1dHAzZCs3aVB1QnN4SVNXQTBWMU0wS094STBIaEkw?=
 =?utf-8?B?aUFWd09SelR4ak4rMW9naG10SjVqSzRhNmFmVmtCUkZGWEVlUFU2dEIzNnhJ?=
 =?utf-8?B?NTFLRzhSZzBpMnBWOER1Vkw3VkNOWWo2akVPYW9tVUFDZHphY2I1VFJFRlc4?=
 =?utf-8?B?RlNZSWNsaGpyMVlwNmJERklYZE5HL04rTnZ1WkFwRENtaXY2VzNEZ2lIMmNt?=
 =?utf-8?B?WnBTM1VsZFJDS1F0aGRRQmttT0NxSFBveU1iVWI1aGUwRG45R3ZwL1BrMTU2?=
 =?utf-8?B?R1lCc2FXZndBQ004Y2d1WWg4ekVJSlRwMW1lc1ZiYjNxQk5mUHhvd3d1d3dO?=
 =?utf-8?B?dVNhR0JBVExLMjg0ZkxWR2R4QnFLcVFJbkV3NnhjTTBtMjZ3S253SHIweEdt?=
 =?utf-8?B?MGV0QzVmMVZzODZkV2VTeXRGNlBBZ0NBQTJyQUVTZ21MeWM1YzdRRDdXRGdB?=
 =?utf-8?B?eEVyKzI3dU9pSVUvcHBBNlljd3d3Z1NiR3AybFhXNU9jYXdnVWtNUFkvbGdi?=
 =?utf-8?B?WGVuMDYvblpHU1lzbkhMcGhMbER2MkZkQkpwQWk3bGJwaDVERTNhUmNEVnpZ?=
 =?utf-8?B?QzduclJEWVpWZE16M1pvZXVLZEVPc0NRN0gzdHVyQWFXdHZJTzJJMGUrQXNk?=
 =?utf-8?B?RWdNSHhvOVQ5Y1BldUx3Mk9pcmZXNDZXclN5OGZLNkhvWmdpUVJkTTZtNmox?=
 =?utf-8?B?VCtQcHplSlhTcHhLemllRDJ2aWJNZENNMmRiTWNMSURsdEwrRUxiMlE0Y3RE?=
 =?utf-8?B?VXdYL1VNRUQ1UHpHaTRadFBuWTZhZHVzRHVWMTFjemcwbkhnU0MxMU0vQkNS?=
 =?utf-8?B?RUlBeFNwTjhXUFRLZVZZU1JNYUV4MUJidmlFc1o3QnhDN2N3ZEtyWUxkUm0w?=
 =?utf-8?B?ajJ4QWJab0RHYkYrM3AvNS9YRTdqK3lqV3lsNVg3ZGN0SlM1elBWclVQbFdJ?=
 =?utf-8?B?b295cUJDUTcrQ3ovZFlraHJSUmFxdy83RkJYbmFXNHh2M2xyQ0dnM3l1OXhB?=
 =?utf-8?B?d3A4QXI2QlpVT1VXTnRyWE5PRE4ySnJ0bk1Rc1lJa2hoY3Zjb0F1OFkrUytT?=
 =?utf-8?B?MUNlZEVDd0oySFFiUXNHem9HcHFjd2NjY2c2cUtFSG80NGtIaVVsRDY1QUIx?=
 =?utf-8?B?ckdWclNua2g1Q3BBZ0hobVdXZHNFS0RnbkwwUlpDejNaRlZnTVI5MjJVdmR0?=
 =?utf-8?B?ZGZocVU2R3Fnc0JZV1I3Q0p0dFB3NUZLdjV6VnE3VHkrK3daMFN4Z00xeWJ0?=
 =?utf-8?B?R2hERkt1Q0RWMVkxd1pVODNXUVdydGZYTGpTSGZZVlRKTnAyK2xzTGhSWjVE?=
 =?utf-8?B?UU9Eamk0aXhrL29ENkp1dUE4eXNGckJmVEVMbjlKVzgrRTFlK29KcWdjY1ov?=
 =?utf-8?B?L29WRHNuNjhkSTZKcW5KRE9sSXFGMkRaR1dCditZblpyS3IvajJ4QktoWFVy?=
 =?utf-8?B?d1Fvdk5ybGtNWHRhaGNWRXhyaTlJbmE3d2thYUF0V2VIQnBlRzYwczhUbW55?=
 =?utf-8?B?U1NoNDMxNkZua1A1OS9JVWhUUGFRVEF2ZHlQMHVFZDdxNTRSTHhpQjlBdVcw?=
 =?utf-8?B?eDNUVE1yaG0zT2xxelBTMmhFdVV3QlI5MWlPSVFBa3M2bVVsZGR1YmZXUTV4?=
 =?utf-8?Q?+3HMFiTlmtmklT1VHxtU3XLpAAMJN+L2U2BgFMu?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114ffe1f-4390-4040-112e-08ddc29d95c6
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 06:13:43.8885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB9063

Last updated: Jul/14/2025 @https://github.com/sophgo/linux/wiki

# CV18xx

- Ethernet DTS part is applied to sophgo/for-next, will be pulled in v6.17.
- rename compatible string of the USB device, is applied on 
usb/usb-next, will be pulled in v6.17.

# SG2042

- Network: Binding/Driver part: Applied to netdev/net-next, will be 
pulled in 6.17.
- Network: DTS part: Applied to sophgo/for-next, will be pulled in 6.17.
- SG2042_EVB_V1 & SG2042_EVB_V2 Board support: Applied to 
sophgo/for-next, will be pulled in v6.17.
- Add more sg2042 isa extension support: Applied to sophgo/for-next, 
will be pulled in v6.17.

# SG2044

- PMU support: Applied to sophgo/for-next, will be pulled in v6.17.
- Add ziccrse extension: Applied to sophgo/for-next, will be pulled in 
v6.17.
- Reserve uart0 device: Applied to sophgo/for-next, will be pulled in v6.17.

Also, good news: in the next development cycle v6.17, we will submit 
many improvements for the Sophgo product, see: 
https://lore.kernel.org/sophgo/MAUPR01MB11072B86FA33FAFCDA1FD2D1CFE54A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM/T/. 



Thanks,

Chen

