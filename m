Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010013.outbound.protection.outlook.com [52.103.67.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1436E3BB4A
	for <sophgo@lists.linux.dev>; Tue,  7 Apr 2026 00:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775521140; cv=fail; b=gQ4PEC0jxVdqJT3Zl1rJkwRp0185fjtBJ/dbTZ2qX6xNZsVmXTdEBtsQ+l7qN/B9zkY9KKJlOr+k/sEu2WaRpvTi6iawU5IboL1cV0maukISQj/9Q/eX3OzhUVAtMcZZPCAj5Fcn2s6+mGSVLfS0EIRKTKGG8H/MZCmParH1wIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775521140; c=relaxed/simple;
	bh=Tsduc9xXB+3dBLoaLxtVmCMXzramrKWgRxpUM9Dq/qw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DTXPITrHRufVCvUuIV1rMGll+OXqmOaTruG89n3A8jwZe3pEGzhQcHBUiYQu7oGaMRdKQP4TeSUgcBL1sfLswKX5pQnLwOwA77QJAqp+svFH26eHaPHqsvnOq49R6j7PMGsqdPxYuHkioQaIwllVC+PdzI/2EI3gO+Xwdx6otyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=b6lWay2e; arc=fail smtp.client-ip=52.103.67.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="b6lWay2e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHUmb7lgMaKnHvxL4H4tD/n/WSTEEuBBs/qPrVwZ6F2ZnJSaXitqUj6S+QRqMabaR09hPBUs4LA4SbsmcoOlp6j61ZH67I9m4kNwMPMUjFbgYbiv4H6cJeLtVFgBMT+hC+04TCP4yDNysHrPUP6UCvdbZ7WCq76mk4JUymlTS2Hivd0MdSEmAiuIcBNbJcq8GTYM/inEqBn59IK/XbgekFAlZsbVlHCJH1pBBgnIgRRnrLwaLj+8B+g9rH/0W0clWPDNM0gvoz1ieUeeCmEG1GDEWPnA5ZEDbj59/F5aCkHdQxb/TAyMUCt0hV+rRTbitCz6lymd+BoKZWPZOz/rqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/N2Eomt0vbmQ1jneRWKV1BTYqPHHkykDsLczmMHp5w=;
 b=Ddcmi1Vc1boxyXuI7UQJJuS7QIcabxDM+l2LHlFEBXc+F66svfpMkvj3kl5SE+XkZ9EQLWizMakEvvpVPRFYei2z9kKZYa0JwmKDk3l+KQJSBtSAutH5CRodRRmZAJjgxB36CfpwqHr7LjgqXc6h5xjnmrCBT//7dofQ6Utd1QkZRmiWvLFEd2XNBOvjNi4f9I8gYLnNeAOqLDM8pYLvSqnv/Y3LQq+sLmUKKX1W0riSd3K8KnFVC9quJWrezqKrj9dYQ40XlqIkR+8GYlXmkgQEiJa4vY2TAyQZh3FrKzcntSYZAKFHgxTSwVATXjpLnJucXnhKR4WaKpdMW3kGCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/N2Eomt0vbmQ1jneRWKV1BTYqPHHkykDsLczmMHp5w=;
 b=b6lWay2e/2YeXGyQXFo58RXaJ1CO3aY1NZfWbnP6sFu1T6VXWo8hXeP7SBESY1h2Gh8ODucEK/9xLJMwTsvTZYyX4ImTrekkiuXM5zFN+f9pNNUv4kOnClq+HgpZGiNfAJc/C/Zw2cJK9qexqa1bYeVxtcdZNZ9amiY25L70RlJjG6DK+UC1wWH88EUgNGk7NfmeBez0SalVaJDD3MuuGcqohftkQv8rtBkg06MoQYez1/saOzMm5IUpKxO6pVdm2XUawo3d5MdVJW2rKdkjyyoHCuGrZ9fhT0B9rk2673Wao1nwgcRm8RLAGTC8rmFPULvVaPC3/nYOq8D9p6UFqQ==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by MA5PR01MB12608.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 00:18:53 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 00:18:53 +0000
Message-ID:
 <MA5PR01MB12500000EAB10E45069C847C1FE5AA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 7 Apr 2026 08:18:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.1
To: Inochi Amaoto <inochiama@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <f99471c2-4b7e-4475-af71-5c0ac4c92809@app.fastmail.com>
 <ac7rV0xGGVmxT-V4@inochi.infowork>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <ac7rV0xGGVmxT-V4@inochi.infowork>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0021.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::8) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <18b518c7-77b9-462c-b7c2-3c21a5a56ae7@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|MA5PR01MB12608:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db10496-9089-4877-b8f2-08de943b4001
X-MS-Exchange-SLBlob-MailProps:
	YfhX3sd/0TXC3SDMOKasxb1Truxn0Xe/hbp7ET8AkIzB6ZLCCZZxQtPCdRRwHdpPwwTygVhrTFJIwMaJfMPvkh6sZ3qWuZRUinsQ0l7AoKQJjsXSLOfR94cLWlsodkaGz89s2AS1YOemqplTct23b1XOGXIvgo9jNKVGCY5BaQAfhgbazY/46k3qHP/ZGy7/dWOplS0QVMlIC4OKdk4lI4slpuailuj2PjBO0Rm5XlMWsM81aM+9wBJLlQSGIodIXHqd6aXVt2oV4ZDBA9hIIGVaOj6KBzibyTPcwOA3Fg9eew79Ll2GDAx9GKUfhAtKn4h0DILfX5p4gDhDzlCofjDeZ0autW2oFQcIcNJkSyAB/l290IHS5JrjCqY/0WDZkzm8ZXeg09AWNUzgrdoHVicR1ewWE7zisq2YB2fvwdxbLNEmf9iwCmcYLI4ZS8pWeFfiSNCnSOrPlaZdYzdOIxuGWtanJhuJK8q+wZ6dMTDm45o+Z1vKotZ0t9KziKk6e49K+uC7Sv86Jgp8oOAZXJgAH5kudCqz8ZS4ntVT5teMIyCWN5OXFfo8Bc3LtR9qK37xrZ7RDQ86U5jMKOuC6Rhh2EloNMHz00+Btwm+IqvAHUHTlwMBqGW796O9lXydqZ7pTNd/W+28zFI5/AvkTJBQ6s/oxpAc18I89gHCgZHCp24LMCJMz8mnM5ZLal1cGuJhVg5EGkjRwBYvWsjFT5KLM0ZA68pZLnpDVqDKb8aUMbkQOJRg3bayKP4qx6BekQCu9pzSVhNnC6BUn0ZabSrjotC/tVJSYuI986eVCVU=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|8060799015|23021999003|19110799012|25031999004|24121999003|22091999003|6090799003|5072599009|15080799012|52005399003|40105399003|3412199025|440099028|26121999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUNKVS9TMGdXYmdTdFJwdGxCcUtyc3krYVRPUWgvQi9PajJhdDNNRDFuc2h4?=
 =?utf-8?B?YUdsclB6UFlCZmJ6ZVgvVGdVVVpZbStvWU40bVRMVEtZTmVnQkZYbkYxQThP?=
 =?utf-8?B?MHhWR1E0MGN1L3p4eHE2cG4wdXB0Q1RoYWUwemZHWG9QUlJQbkVNWTFuUmZx?=
 =?utf-8?B?TGFnekgrRjVXV0p1QUExYzI5RVNIclozSG8zQmh1UWN1Sk5qaHNLTnMxdDRs?=
 =?utf-8?B?NDNEVGZjamRSNkVJaHkzdlpqcWprdDFSMGdzOGpORHZLN3RIdnFDL2dRa1VV?=
 =?utf-8?B?VXBTZHk5Z0ZNbjd3cExVSWRJSUUyaTkyajk0M013ZTNMckVtN1oyak5OS2Ja?=
 =?utf-8?B?eTJ1MzVKTk8xQXY4S1gyb3h2bjEvN0theDh5cDhTa1Zlb2k0UWUwTHpwSVFt?=
 =?utf-8?B?TnZWYjdZcFhZMnQyMnlGanp0Z2w1eXdkdnRpZ0NJbkZTTnhMWEJ0L05UUjBX?=
 =?utf-8?B?MTRHQ0JtVGhjZVBkSlI5bGcvSmMwb012YXhSQXFZbXZiMlpFRmxodkNlQWts?=
 =?utf-8?B?YWVWTTVodmpjZms1MGN2OXNuVXpnZjN1TTB6ZUg1REk4VFRtYUhycGsrbHhC?=
 =?utf-8?B?Z2ZPbjB6cDliZjhSeEl4T1VLN0VkTDQ1cmRmVTc2L0FPaXNNaFYvS1ZpLzRL?=
 =?utf-8?B?S01NZ0M3RkE0czNOQ050a2xHK25OVEFHcmxidnlRK296Vm8relIrVjd2KzdH?=
 =?utf-8?B?RWtCelRDbElKSmZCUmVta2EvT0xXcGNTcytUbFI2MzZpM1Y0Mlp0TzlvR0hq?=
 =?utf-8?B?Y3VUbktvUzJFOHdFUmljeHdEU0IxVjRENm1TekhkQTdrNEpHR1FqL3hQOVlQ?=
 =?utf-8?B?S1JJMWUwSUQ2d2NGd3VDQzcxRmFiZjdOSU0zRUlFYWVzZVFQaWNIVFUxdUNN?=
 =?utf-8?B?WEZCOU1vMjIzTGFjdUEwWXlMN3NhR29FTjNnbmVtOFl2QnlTMXk3MGd0dG1M?=
 =?utf-8?B?SHNFYU1NQ0g3RHFFaXpsbW1TV2ZmblpOUEdPdXFKWFRVdGRlSjluaXphbDhU?=
 =?utf-8?B?Z2V3Y0xIYTJ5azBYZURqcWhiNDcwWXBaOFpiblpLYUU5bzZBZGtMclEvb1ps?=
 =?utf-8?B?WXNUM0FtMjZzWXFwTW9sRTR5aXJ0N0tRSnRMQlQ3bVUxT25KWll5WVYyR2FB?=
 =?utf-8?B?dGNlNFY0UmhvZjBMQ0s4NkUvUFlGamtPQU5INGhLRDV0NzZha2VTRGUyWFRi?=
 =?utf-8?B?NFRScGtGSVhxOEp0QStOdWMzeGxEeGROcnBKa1cvQ1ZKUGM1bSswQisvZDRn?=
 =?utf-8?B?aEpPTXFYZ1RHdzF0RWtMYlgrTmZCU3ltRkRGc25ub1lvTUd2VGZEa1g2Z09S?=
 =?utf-8?B?d01MdVovZWZHaFNjd09oMVNETUNjU0lLT1J3UkdpQzBXSWNBUW5idmV6S0J6?=
 =?utf-8?B?ZHdaU281RzFyNWc2SWpaV21BeGN6aCtQbnFLQVhGS1p3c0FlYzQwdUJubytW?=
 =?utf-8?Q?yVkWAbsM?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWxTNm5PdEwxdm9rL1RwWDBtcjFzYTkvRUczOGNuamovZkRXb21aVHJpRFlF?=
 =?utf-8?B?MXdUM1F4QkpWazJPQk9KQmV3cVhmZEpRTTFHNjRZbWgzUmVaWjlUbC96YUpQ?=
 =?utf-8?B?YmNkcUx4czNobkZpK0lkTi9mUmM1NXE4dUFJVFFzMGwxWkZIQUgxNTEwUkxa?=
 =?utf-8?B?b3BEWFlzcGY1ZFREUnNGREpaTEs5ZmpsV3o2N3hQbjR2c1NxbGRvZ1lSc2Mv?=
 =?utf-8?B?RkMzNXljQnl1MDh1VnRXUVVPUXI5NFcwZ3BtbFZXeEcxekV4WW1iRGVSVS9W?=
 =?utf-8?B?amZFd3Z3dCtiQWU2THZnK3Q0dFBBUi9QRGIyLzBRQlZCUXFyc3B3UWZwYkVj?=
 =?utf-8?B?VGRYVk8yZFF3Y2JnUzdvS0RJNGIrREF5dGRYM3NyN01mb01UVTdvZDE4cFNP?=
 =?utf-8?B?elhHNlYyd0E1TUZ0VHlwSVRtbTUvbjR4RENRU0JZVDJ4alI5NnlpN3Ayd1hp?=
 =?utf-8?B?ZmxFeGR4dnc1bWNWVDJaeGkwcUk1OHJmVEFKOVFQaS9wUVFXTkV4eU1tcStp?=
 =?utf-8?B?aDZxUE9FandlUUE3T2QrMC9SN09kMEg5dDhDbjhXNFpxdkNtNkNtRlhyUVV5?=
 =?utf-8?B?Um5HWCtiWWNVQVVOZE1jOVZNTE0rdGlTbzhLaisxNjQ1clFUak1jTGFSTkF6?=
 =?utf-8?B?TzNZM2R1ZUpPYmZEZHYra0VHTHcwTlRadVF2WjgvWWUxNGlFU0U5cFdwUVBZ?=
 =?utf-8?B?YU1Rb0l1Q3dsYVB0MGpEc0FBaEVmWHJmZXV4N0lxbnM2TmpPM1Q5UGk4NzFL?=
 =?utf-8?B?eEJQWDd6WW5rZEREdmRoZ25aM1pGaVM5bDJFdnorKzFQb04yaU5sTWhsVzFV?=
 =?utf-8?B?MmhtcDRNUFBiK1B6dDd4bDJTSHV3S1dyWnpTbHdycDdYdWhVbzRoaUVUTVZr?=
 =?utf-8?B?VWxaT3YrWHUzZzBTQmJwRXBoaGM0TkNEMUE3WHBQcThORkxYR1FORThnTDZI?=
 =?utf-8?B?OXRyb0VnWUFqaG5nSlo3UHExNzlUSyt3QW5ETk9HQlNULy9aemJua3NVRndE?=
 =?utf-8?B?MHdEM21ld1VERFlMb29WZE9VcnhUdUs4QWxiZHRwcmVKYWFWTzlUems3emwr?=
 =?utf-8?B?WjlBZ3YzSXN6cmNpeWJKbVprSjFKb1lJbmZZMk16NUZBNmMrSUlJRkxIbnRy?=
 =?utf-8?B?OVZ0a01EaHFrTXVjTUhSMXBlRFc0Z2VDTmo2aUpXUHJDemNub2lxUjdudHhy?=
 =?utf-8?B?YmpPbEhiRVJTNjdEQnVQQnVGY29uNFNrNjN5Um95dTBmNnkwdHQzM3QzY3NG?=
 =?utf-8?B?S1RIejUzR241UkUxSmI4WlB3MHZ1YjB3MjVGa0srRW9EYzE3Qml0MW1jWmxv?=
 =?utf-8?B?TFE1YkZvZ21RYm16Rk05aVlxQndRM21ZczdYWjlFdjBhblZYQjdRa0xMVWhB?=
 =?utf-8?B?aHIxUWI3VVpEclRXeGI2VFREV3FPWE9MOXo0bkxGdHBmdkQzYjJlY09mZ09G?=
 =?utf-8?B?ZlpOVlRNVDJMb0FseWZuNGVQTEFUaXNHcWd6MkdRM2pPaTc0d3BjZmtxN05t?=
 =?utf-8?B?Ri95dnNWTFZVVi9ndGNKSXdEWDJLVGdueXhzY2UwY1JJa1psNCtoTmpzWTVn?=
 =?utf-8?B?QytPVlV0a3pzaE9pSnhsNVlGOFpCbjJRYURZMHF2RFJ3L3RJeXE3bFVMWGdY?=
 =?utf-8?B?NWdxcWNHemJsWSt6SWRScWpYbzhJUWQ2K2NkcFBuYzZySVNPV3NqVDc4ZjhF?=
 =?utf-8?B?enQzZk9yMjVIZDErOXIxQkRTbEw0bDg2dDJOTStFZDZHRkxFWVI1UXQ3MXFW?=
 =?utf-8?B?SCs5WHZWNmFISzBXblZ5RXpWYnExZmhSZUNvWmFjejdXdTVQWTY4UDdzS2Nx?=
 =?utf-8?B?Smx4b1ZzVVhwaUIzRmVRUDYrOEEvdFBtOTg3TkFJUWdwTExVYkxrN2s0Y3Vx?=
 =?utf-8?B?MTVZZTlXTWdjRnhYZXJPT2JEaEwzM0xSYStoQ0JhZkZDVm9GNTNlRklRd0tH?=
 =?utf-8?Q?8r2rviQTjW6kdRJ6P3nm7mGuiHlXdPOO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db10496-9089-4877-b8f2-08de943b4001
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 00:18:53.3524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5PR01MB12608

Hi， Arnd,

On 4/3/2026 6:25 AM, Inochi Amaoto wrote:
> On Thu, Apr 02, 2026 at 11:43:43PM +0200, Arnd Bergmann wrote:
>> On Thu, Apr 2, 2026, at 04:39, Chen Wang wrote:
>>> For CV18xx serials:
>>> Just a minor patch to replace the compatible for
>>> dma-controller to allow setting DMA channel number.
>>> New bindings and driver part change are picked by
>>> DMA subsytem and this patch handles the left dts
>>> part change.
>>>
>>> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>>>
>>> ----------------------------------------------------------------
>>> Inochi Amaoto (1):
>>>         riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set
>>> channel number for DMA controller
>> Doesn't this change break backwards compatibility with
>> all existing kernels?
>>
> It will break if a old kernel with the new dtb. But I
> think this will break nothing since the DMA device is not
> used by any devices in the old DTB. And if a user force
> the some device with DMA in the old version, it is just
> not functional and lead to a broken system.
>
>> I did not take this one for now, need clarification, or
>> a new patch that keeps the old compatible string along
>> with the new one, if that is possible.
>>
>>         Arnd
> Regards,
> Inochi

Please ignore this PR. We will have some more change on this patch and 
submit it in next cycle.

Regards,

Chen


