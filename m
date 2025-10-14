Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011036.outbound.protection.outlook.com [52.103.67.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D258223DD5
	for <sophgo@lists.linux.dev>; Tue, 14 Oct 2025 03:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760412493; cv=fail; b=I3O8SmXtzrN8PO8NAmZf8uOxR61YqJ+tq9PB3IxrVt/kIyhhmV7NHvdPsHUuALcSX4i1dJQXIE8ki2+jOtSCvYHLHhsSj8enbLVQq7mu75yL1kgjikFn4NacZa9SqUAUqi5YdFro49ZF74PEQMfnVpZnWizbyqNYTkxUr4JvFcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760412493; c=relaxed/simple;
	bh=f8FTl+q7euhuoqVzlAOdByxD1XGWnyXsjzIPb2WUXdg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LRJnYdopi4RB/31FzmYaqmtV4VfBlRi26hD2KYS3SjimVPjntlmW0pSnzjkCzognj8X8l/fNa1ENBNeWhzK1bPrPknl9WMtnmh/LUim2ynbfrInMC3g1p3OVk4w4fx4RLmRHDISKhQ6TfYCd2YHqGKJ8+a6osccn7YcqfKMT4ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=T+nd6q1Z; arc=fail smtp.client-ip=52.103.67.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="T+nd6q1Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gL1s/TQoYnCSdBHIxgMxSDH29HyRiwDRQvttVy2vNdBBKfDcIO7z0cqRwtW/Y05l0ofE+1K9MreXRP4ebcElcaX86siWVBm3LDFd5ChB2uwI2sIN//Zq+VrA9YN88Kg/v6dIi64ev3PoGbP48TzHSD2RjEM4Ck6J2p3YNocWNIYGoldsgMZ5m4SXjwM4kcamYx1OrufJgqsBUQizgTxTVQgT77VRjWtwK6Lb8PVc9HP15U6t4S/ESweAdnblU54ccnXve8uoFXj+ZCq+yEQPwuTTbQQkxdZ/DHMSHmXnQCbaiq7YrEF15aZMLMMLgMdFMQVR5Xwt8GcuwKCUJgrq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=songDMsFxM0Kzy2cSd2GMNsZLVsCaDA8FWTdBl8wDoE=;
 b=w/DBocQ2Jqv7oZNV721hUWZlEmNu4J5r1aRFBz/S+UDtX6PA1F/uTq2VOk292JVAB+Gdw/Xzdhn8dqbbvDYBGXPj1QTzZSMH7wv/+IhYVh1/t+GHe38LLSVFE5rVO4NNDPlL+XIRZbv4DdCt6cofCYsQUxcqGQwvmeLuY641wCZIoJnRn9pKbYbWBwl8BTbPMg3n2BqAKtnwJkXGfdQOSnKopr3F1YU0U9SJ5tAH3lCKv/yPnz/QR5eZ7GjVSVfsG95OVQ8nG+/+Tsd0DZ1LnewZSRwlWKE0pM31IYvkJeqgYbFjbag6gFCdROYYDbW29P6DGymoDqZwlHhwSHDciA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=songDMsFxM0Kzy2cSd2GMNsZLVsCaDA8FWTdBl8wDoE=;
 b=T+nd6q1ZOJSMaa9McET7ILzxRQpnvQnzabFUhBAY84rkqHmg2GYJ8sElHUtfQA8PNRXiag6x7hjiJs0tcL4vQAF35RCh/1l0hJDUZORDoWYYafyRAn+O5869qcSX/2SZc0T1aAGv9CCxvjIMbLOBO6tnJa+3z54gqX8J0tAZmqYnC81nY1IMKlm8WaMK6F5CAmX6ZsVWjva2hbFlAXBA77+BBK1DUpfjaI2YTrv3/SgvmulqOuEBOyvSE78gbrlHlPuq28EbP6b0Cs4RxDDXLHuYtKyQ7ulxB8g5eKZgNA7hLPdCyX1X8iioKdZVp5Ha+wjbY6HSxrRqt8xwuvRUyA==
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
 by MA0PR01MB5616.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 03:28:01 +0000
Received: from PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2e35:fc95:ee3:bf0f]) by PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2e35:fc95:ee3:bf0f%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 03:28:01 +0000
Message-ID:
 <PN6PR01MB11717636E5B85CFE35B7B6653FEEBA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 14 Oct 2025 11:27:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add initial Milk-V Duo S board support
To: Joshua Milas <josh.milas@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, inochiama@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
 liujingqi@lanxincomputing.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <20251011014811.28521-1-josh.milas@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20251011014811.28521-1-josh.milas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0192.apcprd06.prod.outlook.com (2603:1096:4:1::24)
 To PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2f1::8)
X-Microsoft-Original-Message-ID:
 <33a9d32e-a8c0-40db-897d-2240bc4513db@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN6PR01MB11717:EE_|MA0PR01MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ddbbdc-fc47-4220-1191-08de0ad1adcc
X-MS-Exchange-SLBlob-MailProps:
	RlF2DIMZ1qU1KA69x/B2/kCnokZ6o97mdyUAB13t0BBXEWdyT/lJrOQI7/mEPepGF0RgPAC+VWs7zQlrlF98lBHEcXdUrSFxgh00hQgZW52y3KhWTHdHf14fs/B5F6IMlJ30m7Vu+Z5PuA1QiLLdxSSGCVrS8I26UsOq683sVNR20DVYEXluhsOwv0ECNJTJGpZoROTDScNF+0+bnZZ35jjt3JzyLvzhFdSLeg9Jyn2PlOTjwElEjeL0k3uRHQ3b93HqAO+Vx+wI7H/hjWoaYzhbxI/fbPHOlfIkUl+5karebC0+m2ToQ88P84eOvYBKAZcM1KAhygUqVdn/OsB323AtakX5YfdVqodigqg6lKF4Y3QfHPig1WqwCSHGNZf6sqqYoxA4ouSGwc/zzSFXCM/L0+tmSBQ9nxzBj6zBcC5hs/MiJ1HrfogtGFHPf+jB+nvvUARr2WAVbGKPKK1S69m6rHXO/dA5+g00ySm6gpAM1NjLikOMIroVsC/h1b7RJuSvF2v/pF/SBAQznnQpYiLYHmf8AKvJbYSegQD3sorVs1J2R1g+GAw+PMKx/yW3/IiTGQdAyRRQU8gsmLcDNnBOKmHIqJIHcUXX8CdLt9/eBNJ08EvyUtF/g6+rk3RP8Uie+3CdylKMqORq60kZJF1oF2kvjn7eRdsdPGMBzByFl7oxI2Cigbx784lTTrh8SAosliaNN3epUdK9kKfhhHRVzxw1CNo70KO+G1bjibNOytRwh6TI91arSl34uAhoLSfvqTsJXqS9eJfa4tV2gdjeEVf8hvJsCQKEtZ1QPHxgf6lOnSIv3DxjLkLR+EAhBE0C2UL4dWPMy1DhTLgfKnb4O4+tN2T7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|461199028|6090799003|5072599009|15080799012|23021999003|12121999013|8060799015|40105399003|53005399003|3412199025|440099028|10035399007|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?by9sdE04YmwvUW9CRDloSG1Md0djTUJaTEtHM2RUTlJrMHVDMkJpSW8rUC9J?=
 =?utf-8?B?dGFJRG04Z1NjeFRJajFHQjk5NXd4YnRYZEZ5TmNRcmZhVldzRyt4ZURDYUN1?=
 =?utf-8?B?K0g4OW4yS3RlQlA2dGQ0Y3ovZEpRRmk4TDNJTG04VHd4djJqTG1DUjR4ZHU2?=
 =?utf-8?B?dGsyQ250dzZoSFdPY2RqQTMvWlVZWktDTG5BR3pDUlhySWZOeG1IUmVXYzRG?=
 =?utf-8?B?cEFrc3VpdlNrditHSlYwWG40TTMxRk5zRkdUZjVTeEVhME5FWloybkVFRjY1?=
 =?utf-8?B?eWtWQldtSitpWUlVQVgrY2lnc0I2TXJVSVRQbjVjV2JEM0xFdTI0eGxBSjJo?=
 =?utf-8?B?UzJwRGxiU2tDMzgxOGF4TjhzTDhuMnl0VnJSeld5b085WjhwTVNwa3FDYzFq?=
 =?utf-8?B?TTRGdkh6eWhXNUdJaDV5NUwxVFJMZUJFczRjdjdYeXNXTXNZbmxTbWV4TXAz?=
 =?utf-8?B?MUFsTWNzOGdjL3F4VGJVVlBsZzIzUEpuOHF5SGdrL0ZuRERPb0FadTRnUXhv?=
 =?utf-8?B?TVlodDF1cFdqOXR3R2xRZmk1dUx6NWhobWJVK0F6aHJSbkxnYm1tYjhmSDJV?=
 =?utf-8?B?bnY3ejdCZ3EvcHlXM0ZxWll3MjNGTXZUMG03eHQveXQ0c29UWEJSdjVWN1Z6?=
 =?utf-8?B?dTNnRTJaUnVETFhhMC9rdmNqSm5wZFF5SzJsbXZwdGZ3NVUvMmE4U05Ddm13?=
 =?utf-8?B?Q0lTQTdiL1BneFIwMDhkY2F0VVd3UFQ4VGlSdzJnVzlxQkFWSlhsS3VENlhI?=
 =?utf-8?B?T255aDNVMmJrNWxGNnBYS3p1anBkUGtLcXZJbUhFOE16U3VXQ1hlZkpKY2tn?=
 =?utf-8?B?TCt3aTNFcGd2ZmhmUUFxUFkraWtodFo2ekxaQ3hIb05PMHM0MzlRNU1qbkZw?=
 =?utf-8?B?Z0svOGFqVFN2WE5zNnRGU0FFdzVkK1M1a1VSNlloQUw3aDVwWmNqSGtGR3RV?=
 =?utf-8?B?NWNPVVBSVFRIMEh1NEczZno3VzR1SGtxeWkxMkplc0xmd2d6a1NLdHR2Y2dZ?=
 =?utf-8?B?WTNtMjNFNDNpcENlSEUyekhUUmlIK0RPUXVOa3k3bC9SSGNpczRqdWM3K2NT?=
 =?utf-8?B?R29PbjlaUmpsckNmazd1dmhpL3h3MHB3M0Ftck02ajZqMHlUS1N5eHZIcjJS?=
 =?utf-8?B?a1duZlJSVkRoVUZiQ25tWVNlZXcrbDMycnR1L3BuRjJtaDF2S1puWVNVZUdU?=
 =?utf-8?B?QTNJbWdmbHlSYWd2alZzSTdrSEFpQStRenk5S2Fzc1h3Qnc0QUVpZzRMcEto?=
 =?utf-8?B?ckJVNlZNK1h3WDlPUE4yYTN3YkxYRHBWYVJlZXFLMnZ2QW1KeUFmb1kxU2lQ?=
 =?utf-8?B?V0JPT2NyaGg5VzdNQ1ZJRjRtVzNqQ2RZcW1HZ1B5ZzZ0ellUV2J1YWNKME52?=
 =?utf-8?B?NkFGbEFuRnFRRlVTVHB1TlQyWm5YYkZOOXJ3aUh0NDFQS28rdTNYS0FSdEg3?=
 =?utf-8?B?NVd0c2NOTXNWWTFQbkp4ZFBZR3NBbG9wUGEwNGpxelhqNkp0L3JYWTZYZ0dw?=
 =?utf-8?B?a2hkU1NtZTBMUlFGUDh1dDJidFRqM0svRC81SWpqeXR1cGl1aHQvOHRZK2JC?=
 =?utf-8?B?ZDUwM3orLzNkcEpJWjNrdXFxOStLZ0tOeEJJcE40aW9rb1R6QkpWSzJSOWxZ?=
 =?utf-8?B?aUxwNEVKWkhZK0ZiN2NsUTQ2NittbFg0OUlIU3RWSmZWTWNwbUNiRVVPYXlO?=
 =?utf-8?B?bTAxb1BGNjRrYTQ3RStab2I1ZHdPWVJaUm5ROG9zUEhFUXF2NDJEOTVRVXV1?=
 =?utf-8?Q?Tue9d4QSirUDSiEBZ+8dLy3ZJH5856lY/BfRLQn?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmsvMjlkbDArWnptTTVaUVJQcVRxaUxqbEMrOFR4SklhN2NGRXhWS0JxNlkv?=
 =?utf-8?B?OVRCd2NoN1lKWGw0a0lQWFNJaDdUWi92NXBpajg4dTJtMTQ3VE1uTE5IQUQ0?=
 =?utf-8?B?Y3lqY1RGbng5cWExQURNMXNidzZTQnBnZnVFRUhwc2VmS0YvUGp3a1orb0Ix?=
 =?utf-8?B?QjlVYWFNYTBQUy9yTzBVUVFoRFo5KzBHcUVPMXBYeU5jcTNmMG9tNkZyaGFj?=
 =?utf-8?B?dWQ1V3dDem9HSEhIK2srYnFtaDRNQkN5VnRoOTlBa082US9hSWhrTkxRTVFR?=
 =?utf-8?B?SDN0SGNoOFhPa21VT3pTMERPZjZvQWtsemJkU1NOZkdmQmF6YzFZdXAwdnBJ?=
 =?utf-8?B?VWlCOUhVYjU1dW83eWNGSUcyeUNoam5pYkpKQXZJd1VjMjFsYUV5aVpJeHN0?=
 =?utf-8?B?RnI5NUo1WVFEQlJUUXVMWkU3OTViSnU5ajUycVh1cWFxa3FPZEdkT3BVRVBp?=
 =?utf-8?B?TlRxd2VMaUhueTNPN3BDMis3aEtnQW16WktLUUVtZ05UdU55OUlVZUJaNmVs?=
 =?utf-8?B?ODhHd3l3QXdvelNuams2VktIL1F5Yk1QTFp2RlI2UzdWdEVhUmNPbVkrdEtp?=
 =?utf-8?B?VFVEN1o3akRnWFpIc1lhaGE2NzR4MXRKRXpPZ2xGZVNpWUpSZithZGNjRk4r?=
 =?utf-8?B?WHdFYnhmUmcvUGFtSzBpY0FSNnhqS2Q0VVhZdUk5ZHZnUzd0S3FXOGNRQUpy?=
 =?utf-8?B?V0J5bzdQZkRRWFVzWk9QZE5EaDJvbUtoeGZpckdBMnZzUjJCaFRTbi9XSHpF?=
 =?utf-8?B?aW0zemNHaFBoVSsxWC9aUkNwTEd2Z2Rpb3h3QTZlWVlWRVJDcVIrRjNVaUIy?=
 =?utf-8?B?R1BzYTlBeUtTdTNNSVUzYVRtbFNUN1k1Qy8wNXRrOHZxLzZjMHBpN2g4U1dR?=
 =?utf-8?B?Qlhvak5ReERlcFArVHN1T0dFUDBHZkdiaFUyYzFBclN4bUxyOGExMXgrOWhQ?=
 =?utf-8?B?dHB0L1duREVza2VYU3hRcnlRWXc0M2FjUjltN3ErLzl4S3hsM29MTWZUa1lI?=
 =?utf-8?B?U0RZeDFIYXhFRjJSYUVEdzZDc2VoVWdOZklnL0pXcktoL2IvS1d1c0c0eG9v?=
 =?utf-8?B?ZXpFTTZ6WFNObEFBTzcrQXVQMTNQVU56L3dFRTFmT3AzNEVCNU5pODVWYTE0?=
 =?utf-8?B?ZmtwN0I1NmNrK0xjY1MvWUNhMWViV2lvVGQ5OSt6bTNNdjBHMVZZRkh4bnd2?=
 =?utf-8?B?Mko0UEZDVmgwMWRjclcxNVY2WW9obXFCaS92NWJSaXpmY3FkdVBLekk3KzRR?=
 =?utf-8?B?K1RkK253ZGh5ZmVaOEo4SU9FLzVXKzdHSm9BQ1g0ZnhUM3ZFUmluSmdJN01n?=
 =?utf-8?B?MCt5ZGpNS1lvbjRwNzdGSVhEWW0yY1ZrSmdXQ3FPRzdTWkxyNW1HS2VieUI1?=
 =?utf-8?B?M2tXT2k5K1lSVmVLQkRTZnRMVjhNcHJkdHhVdlJCTTVDc251SlV4cU45UC8y?=
 =?utf-8?B?eTgwQUt1S2pCVDE5WmViZUxMMXByNTQ2b0Q1OGVnVXZSUTVWeWRxM3o2RGN1?=
 =?utf-8?B?cEJpTVZJNkluc3ROMjhvNEk4cmhWQlFodDJkMXFlQVY0UEJxRW1EUVNkMWR4?=
 =?utf-8?B?OHVadFVvQ1BzQUMra2syQWE1ajZWeFkyd1ZaZVBmT3FucS9wOGNiMThCR25t?=
 =?utf-8?B?WXhiWWtLeFBLa3ZFYmV1UXpYOUVsZ3JObmFTc3BWbVFoUVJhT0d5NlgwNGU5?=
 =?utf-8?B?WFZDdmovYk94cG4zM2MxTlpxSmxycXIxM0ZOd1hMU09qS09vdnhjYUhLOTIr?=
 =?utf-8?Q?kEfLQoybD0F8LMVZ1w/4MBSgeErMXJjObPaXS4o?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ddbbdc-fc47-4220-1191-08de0ad1adcc
X-MS-Exchange-CrossTenant-AuthSource: PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 03:28:01.7050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5616


On 10/11/2025 9:48 AM, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with both ARM64 and RISCV64.
>
> ---
>
> v2
> - Made new entry in docs to avoid DTC check error
> - "Milk-V DuoS" -> "Milk-V Duo S"
> - Sorting of aliases
> - Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
>    to device tree matching what is available on the pinout [2]
>    and available in the device tree includes
> - Removal of 'no-mmc' and 'no-sdio' for sdhci0 as it works
>    without
> - Added riscv device tree

Hi, Joshua,

Better to add link to v1 so we can track the history of this patchset. 
https://lore.kernel.org/linux-riscv/20251013-tt-bh-dts-v3-0-9f058d4bbbda@oss.tenstorrent.com/ 
is a good sample for your quick reference.

Chen

>
> Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]
> Link: https://milkv.io/duo-s/duos-pinout.webp [2]
>
> Joshua Milas (3):
>    dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
>    arm64: dts: sophgo: add initial Milk-V Duo S board support
>    riscv64: dts: sophgo: add initial Milk-V Duo S board support
>
>   .../bindings/soc/sophgo/sophgo.yaml           |   5 +
>   arch/arm64/boot/dts/sophgo/Makefile           |   1 +
>   .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 110 ++++++++++++++++++
>   arch/riscv/boot/dts/sophgo/Makefile           |   1 +
>   .../boot/dts/sophgo/cv1812h-milkv-duo-s.dts   | 110 ++++++++++++++++++
>   5 files changed, 227 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>   create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts
>
>
> base-commit: 0251a1deaec78252cb311fc8305d3670bc5eee0e
