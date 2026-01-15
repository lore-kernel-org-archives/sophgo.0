Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011024.outbound.protection.outlook.com [52.103.67.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1E97E110
	for <sophgo@lists.linux.dev>; Thu, 15 Jan 2026 00:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438212; cv=fail; b=AtoDvFaixoQ3t4ePvq9hrq/EOM8cMZsIqabjYMe0osj1MoWKIouPMA36Mc7NzOGgJTOTmzyJA0E3O3s48yNeezVvIj6P6fExHBJdzFXHb+lLMTafuWMLsiSLx57MX2uRu2Y/BNRJOBKSNqGdHAASDiLvgOSEIimBvwn1vHZhrPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438212; c=relaxed/simple;
	bh=oSQaYrIhH8qTknjrBUR551KVmzWCSmeV1pLrIhRhyf8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gWY2As1Ko24+GFfTTP1awl9jVBiaC8Xcih/ojoYqCkoB6cNO7sgOgwNGUwjTenKGETkPiHhxUmqLCPVBau6QbwfSU9791QnfIcIQY8nVUm1qXyGht2LvSh6uo5wYkBF1TXPN4r1NIKbv8JirLoxYf2LkG924ZBv08URbw7rv2iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mbgYGcOQ; arc=fail smtp.client-ip=52.103.67.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mbgYGcOQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIAPNlnMq6+ZFioryRfsPMIbHYx25p7Zawe890rjKdsB3Z5/cmvurP/cfgDt+HzeWh7O/x0zIRPrVK3S1mhoxllB6AVXzbgTIcw0xGtVovGYEM/NOSEIhWPbfgyYZLkaHFkR1VmCNTWf3JbYYMHTeDaNvVR+ua75oXMOi1KMtvtxkFZ0yIO88DkXNWgIXZ9Qdb8Ri6eGsLmJ7GwK8WoJh4Lx7uahddLdJU5YvKc+HiA3A6hGcDmcqRmOc7TdICrEp9cBJGyqMTipugT/d+vLVmYwKpv5X6JhTPdf9lE/PsPeeeG56roqJIBIhzaAXDPF7U64K3pxhmdZ6BOI9YVE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RN3f19/xdMXikayz6/ahcr27uRpgYokWWYhDex+JZaE=;
 b=pkktb6HgBZP5wLImhGsjpfEIVO1GMBXw5RPfixeECgxWsIjQQ3VM/EfzbGOmB++RhI9aZww87nh1NoPmnAajnJ+9BhQZZNHcdVT0rOVP6aSG77d4wcj5PrHiY9cXicxyh9evErkzmAAe68bWzJFUkbsAHgCTnoipdViH+vhExsdrT3jOZ2GbzVa+DC2lMIUbSVuemTGib29LzNxZZKWFQTuXaXcEyRu5jc0CXtkgnWi5oovXdz+5/9s4SUJ4cITuf/YIpxpX1pXduDR5ksmQYsDS6UC2/KnKk9f/qOoJOkIsE9IU65+0rKQYDY/ftVXsaXrTs3bLPL0Wxmh8ASXpfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN3f19/xdMXikayz6/ahcr27uRpgYokWWYhDex+JZaE=;
 b=mbgYGcOQLaKiruvnsOf4kbKfdnsOiBtnt6ywV4POTR/38F6oV98XlNpWBRznc6yfY+qVXUfaHOLbZLa5nht9JowAmfpKhJdVudzqM9o8Bddxlij/Kd7tfdBUdn8sL9BaQ26STEXKMVcLlrejGwE0VOOs7ivqkxulGxY8bvAUxWNAzXm+04dUzYmOdO0WoRJrKg+ZERU/VlCPKCEO4ABNLRvtxGsrV9el/J1qnSg+WvVNr4KemXV9+SUBtseD9dyAagh8JvoodL5EmHjouxV6wp4nndBU/5doDSxA7UcHOvZz+Cm1KQNEyPrT12we7xpFbUxY5T9ZHX562BX9B8eeAg==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN1PPF74CDA26B3.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::312) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 00:50:01 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 00:50:01 +0000
Message-ID:
 <MA5PR01MB1250082D757C8DEFE005EE71AFE8CA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 15 Jan 2026 08:49:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Move PLIC and CLINT node into CPU
 dtsi
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>,
 Nutty Liu <liujingqi@lanxincomputing.com>,
 Thomas Gleixner <tglx@linutronix.de>, Zixian Zeng <sycamoremoon376@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260113023828.790136-1-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20260113023828.790136-1-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0030.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::15) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID:
 <549858a4-6aa7-41ab-b312-14f42d10afa5@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN1PPF74CDA26B3:EE_
X-MS-Office365-Filtering-Correlation-Id: 06eb6545-35d4-4294-dde3-08de53d0034b
X-MS-Exchange-SLBlob-MailProps:
	dx7TrgQSB6d5vbofsfC/jnGJ+j4hG4ECk1o3ZU7J+9crJwo4e18gR3WEWsM+3MS2hDctGJqS+VF29k19gqdjlt701oidm4VI55zBWiqWD8NImREoajmZxLQU6jhajWQFoz9DQxZjbZnxYBeOU/Fpeo4jssmIxn+eK0/BZOlwuSU/4ZJikjIb35VXjb0igvKBl8aDXjdycOZ98c0BjVuhSZObock3GHNy0Q6WGZbWwmLm7qwlgxvm41WBnAJJaitcvVFofVTeV4mn1GgsgSsJ/vBwuOsMYCLyWJVEKhNSgC8e1xMwwM2j9E4wwM58SsSxoJrYs6qxl6GXgU+OHSLMdqsXjwiulz+EQ5lX/WxC4Duyeyysn/asMfOL1SKSwraucrbA43QzmV2U4xHJR1cWzHHYIVLoTLXABgwyETo7k91dsTSUfD1ZLd6ynNC3GutdVq54XyONRU7or+bHUiiRXeGJRQhLz4OnErSaQG/vtS/IewV/rXaI1QyOsrQ8jOXT0AOFWWfwBWBEV7i1K8Uh/fVnoleg5CZF4UmIZqMyIcyrFyBoeu0ZCAuyIWzS3j1QvWu57UmEN1V3rr8dee6TRz5CgBTzitwyxuMni2jRgX1A6sykAn/HFHdVVyDOUkOaONyrQaY+40xoonyZaRCDOznvBHZ47WB3mZCupBjC2wyA4ZYtO0rUSHy/RSDsnqlVi0n3xGnjapx/JAXn5lZ26u8UDazXiYNqvvFZLTn1r9d7Pc9LF9/QxRwQE+aYkaUSvGgpOzQX7XQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|461199028|19110799012|6090799003|8060799015|5072599009|23021999003|3412199025|440099028|52005399003|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d0tSdHAzRGV0YUNhVHEyUEpoeEdVUWtSY09Sb3NGVEIyOXYyM3VUVjVFUGJT?=
 =?utf-8?B?ZWUwd2pYUmpkekEwNk51c1VSSlFpY2FrdjZFT012Q2xyYktvK1dpWHVyUlZG?=
 =?utf-8?B?VUxUVC9OVGZvQ2NDK0ZwSVlNSFBqUzUvKzNabGIrQldFTlhqQzhEdHVmK3oy?=
 =?utf-8?B?MURTRHZFa1hiY25BWVFUSjJWSjZNRGpzM21kM21hYmlweThZS1JyK1prT0Fw?=
 =?utf-8?B?TEY1ejNRVXBicjRKKzZiM3ZHc3QvcHNYem4yNFcwcUgxN0VXWkcwMjZFRFJa?=
 =?utf-8?B?V252eXQ4cGlPSEsvZ2l2Rnd2WElYREFETHZSRE1qczBmVlVJMzhvdnh3K3NU?=
 =?utf-8?B?MDV2MzlmODFaQkxiL0JUT2svKzMwWnNEZjc5YTB5NHRPZzJOTmFMdmlwbGxr?=
 =?utf-8?B?eTNyU1U0STdUM1dVVXNjM3dWaW13clNXQXFtWlNMZXJIa29wK0UyRW0ySWlY?=
 =?utf-8?B?SUFzYmZYY0pqWUlSaEN5cnJxVWpRMDZqeTRsNDBOZDBEYnlrNDRHeTdTQ04x?=
 =?utf-8?B?ekdPeldscURrejg4RENoTHFzcU9ZVlMzdlcyOVZ3MGhMdzQvYkhTSWZ6d0Y4?=
 =?utf-8?B?S0hyRjR6U1huYkZPc2JDZCtQbVZUa0M2OEk4cFhDWnlFYlpraVB3WTVFTjZ1?=
 =?utf-8?B?YnRaaS93c3UwSDBTMHhXRzd0bzRyTzUrRkVScjZWdm5KT1RVTDYxeFIzclh0?=
 =?utf-8?B?Y21EdTlFTXpMSGV1T3BubVIrN1JZVHhuTmxtaWg5S25vdjJVNGlEWjhMRDJu?=
 =?utf-8?B?RlFVeWZxbHZmV1dtcHlqRUsySGxRUlN4RHE0R2xMQ1EzRnBGdDgwZmFLRXdD?=
 =?utf-8?B?Zjc1ZFArTnFtUlEzN0JVYlJlakhsWHJuSkc1SWs3eUhGMkNLUitwTVRyeEx1?=
 =?utf-8?B?aWQxWXBIc3pkL0p0NmIwZ2ZIOHJ4UUpaOXkzZGluNDZ4dUl3VW91OTNqby9o?=
 =?utf-8?B?dTJTS3IvWWRHL1ArdlZQOUxBV0w5VGl4NmhYdkNDTE5pc2h0eGw3ZGpSUmhH?=
 =?utf-8?B?YitLdDRZTEc1dlQ5bGVUdFgreG9RaWJHenlMUTFqdWEwYlFibUhXK1NkY2lC?=
 =?utf-8?B?QVl1ZXpEYzBlelYyWDhOeTRPZHhCYkF3bTcxUi9KUUE4bDh5dCtlZnBiM0ZV?=
 =?utf-8?B?NGJ6OFl1TkUzd0pUc3EwTkN4aGlCa2lJeWdEK2R0OVhzcFRLWHF2YXVmdmM3?=
 =?utf-8?B?VEY5V3JLRCtBbmVQaXp2dHhWMmNCL3licjZDRWJBSnZSUjFjUDAxV0ZJcWlO?=
 =?utf-8?B?YTJVUG5wbS9QOTc3MDlEWUFHN1p3Yk9NVzMvQjhOc0JrTzArb1pwSDJsYTJ1?=
 =?utf-8?B?MWgrbmVjb0xlcWZYa2xJcmh0RnUzODl0bHh5VmV2MVFKelRRdVFEVkpRVzl6?=
 =?utf-8?B?SzRLNEJBcjhhRk5MQ2JCaTVWU2pKUnp0N0NrVmR2R3F6VytkNzJZekR5NVpS?=
 =?utf-8?B?azhXK2JLcDlXVitKMk42Qm1VMHhsWW5ZcGVENVBtWTluT0tCNGR4cVpzN3pL?=
 =?utf-8?B?S1JvTW55VmFhV2ZIM2lKaWhRTmpPRVFINzFlZi9PQno3MCtpV3lZZkFEQmVt?=
 =?utf-8?B?bUpBQlZTejMvK1g0cnBRQktxN0tmVTZDREszNTM4V1FTd0VKNWhOVGZ6ci9B?=
 =?utf-8?B?YnZ2dkF1eGZEckJmQllVLzVGL0o2bWc9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0FJK3JTNzBGUlJuNDhBK1ZQWGZWODdwaWtRaHF6b2ZCL2FzblhMMERqRkF0?=
 =?utf-8?B?bDNHazcyckp4WDdqUlM5OFJhYlFSMFdCL0Y5MWhuVGFzSTcreXlCRnNIYzZM?=
 =?utf-8?B?djVjaytXamUyTDhidmNiRXdYRTlvYUF6N2ZaamNtMTBSaW1mWnhsbEtuNXZo?=
 =?utf-8?B?VFVCTWRWU1ZMdHp5UXJ5YVlSU2NGdHBrNUVVWUpQSHo1YnZySkMxZmJhQkdX?=
 =?utf-8?B?bVZpdkVLUEUvZUxlMFdnVU81ZXBtcW10d2FiVjZBVXNlcmQwN1BLVVlUZHN6?=
 =?utf-8?B?Wit3cUNMN3dEdFBsWFllYTdKaURSUi9UK3ZOOXRENGpxbjRDdStCQ2lVVFlP?=
 =?utf-8?B?WllydTV0UlJLVWRkL2FNRndpWWliU3VJYVRPdktNZnlkSnZFQzhEYWpxTFl1?=
 =?utf-8?B?a1dWOG1RdWM5aVBKd2RSZ1NuN2x3bDZvUXI3R2VvZjlYVEM0MkZxRnFqTSto?=
 =?utf-8?B?bkN4RXNQNXpDRWpEUWlLT3IzQklzVU1XRldMc25KdVNPR3FDV1dEUXVvOGhQ?=
 =?utf-8?B?QjVvKzB1eGdQVXBnNENUeHkxK3k5ZEpKaVJrU1ZraEt6U21WcjcwbmpEN3Ju?=
 =?utf-8?B?REhZdm41dk1ydlZJYXA1SnlTbk8vWWlLYkhTSk1nREdwSHZqbS9uZVdRYzVT?=
 =?utf-8?B?VU94WUN6d3RmV3VhU2EwWnZ3VzF1MnVkMXovSW5EOEtkY2V6Q0FPdDRGOGRZ?=
 =?utf-8?B?U3NaUjA3S3pWUTdaVHRNV0RLcXMrNHhWZWRLSXRrcmp2N1hzRWtNMzVBL1Ju?=
 =?utf-8?B?WUx1SGV4Nk5tMjVvZnUyY2VvRXBiVjVmVXVSckVNUzNZQVBrSW40dTRRLzFT?=
 =?utf-8?B?WHV0VDYyUlhlcThpSzM2Q01DdXFLSjRVTjRtaW1DaW1HWlc3OTdRam1mb1oy?=
 =?utf-8?B?bWhPUkVNZ3ZTS1NsMVBvR1RIQUFXaDdjYVJqWEsvNExGVmUveXpJSFpERWIy?=
 =?utf-8?B?ZmZJY01BZDJRWW9vblI5YjNYTzNWM3Z0YVBQMGpSYlJDWWVYRTU2Y2hXNXZq?=
 =?utf-8?B?SWlKU1VuSVc4WC9BajRyWkZrd1hWRUd2ZnRGQW5yQlBKaldiQWlyZFhqSXVr?=
 =?utf-8?B?K2hEZllrSzBtd1hMd2FOOWFuQ2NjQU44KytIeGg4T0ZlQmx3U0F2TllwN3Q3?=
 =?utf-8?B?YzZYaU8rVTAxUFhSVEhqUm9PMEordS9Tcm53RUtORm40dWdNNG10d2FYSlVY?=
 =?utf-8?B?VDR0dWJUM29HY1JRUytUUlRmLzJqQlJGS2dlZ2hlUjZCNGNIM3ZXRXBFOG1q?=
 =?utf-8?B?UXYxZmZzZnQzOGxuUld2V0wrQ0JPTnFOMDUyU2tFUkh3RlJnaEtEdnpGaUxR?=
 =?utf-8?B?VkIwY0hONGh1c1YrMVc3WnBaZ3BwdWVuSGM3NGFkdm1qZHZEeXpnSFhtbXFx?=
 =?utf-8?B?aUdmMW8rZXpwS3hlWDB0SGNiODlpYUZlS2F3cm13ZTRjRllEOUZzQ1lDWFZr?=
 =?utf-8?B?ZVhuRjNSK2FvYmdzZ3dIWE5saXVzUDBOV2pyb0VDYVNlT1NaRHljeHhhMFRP?=
 =?utf-8?B?WUtOQ2NBa1J6NkVqVXhZTW1LNWZlNDZ2bStTQjAwZ3pBalhDQXExWkpGZ2hM?=
 =?utf-8?B?aTZ3Qkw3c2VhQTk1c2VuN1ltT3YrT1FGU3VqWjJEZ0FhUXcwRTVFV1BSbTRD?=
 =?utf-8?B?Rk5BZEdTa212U3RYWGtTSUtJcTA2SlBvTFR6c3lNaGhxNlFGMk5GM0owelQ2?=
 =?utf-8?B?RFR0SVFTdUlhSFhWbXZhUzJaNm1tRXF0QlFtNnFpcXN1QXNJU05tUWs3VnRo?=
 =?utf-8?B?YzRvKzA5SWVDNlpjaUdDdkFXMGRzQnByMWtrOVM3SklwRVMvbmRVcHRmMmJa?=
 =?utf-8?B?NElnZVV5aVJOMmh3a0hXM3pBTWxpUkQvNjdtb2FOUTZYNmdmbkRzbE5kRW8v?=
 =?utf-8?B?VmNmZzFBbGo0NnJJUE9ORk1hYUpHcExJd1ZidkUrUE4yWWVTVElzL2xGNldw?=
 =?utf-8?Q?ivk6gI+U6NN2LGF05u+MInNhJ0ki3V0F?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06eb6545-35d4-4294-dde3-08de53d0034b
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 00:50:01.0031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PPF74CDA26B3


On 1/13/2026 10:38 AM, Inochi Amaoto wrote:
> As we have a separate CPU dtsi file, move the PLIC and CLINT
> node to the CPU dtsi file. This will make the sg2042.dtsi force
> peripheral devices, and make the CPU dtsi force CPU related
> devices.
LGTM, except for the word "force" in the commit message; it seems a bit 
odd. Perhaps it would be better to write: "This will make all peripheral 
devices are defined in the sg2042.dtsi

and all CPU-related are defined in the CPU dtsi."

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 305 ++++++++++++++++++++
>   arch/riscv/boot/dts/sophgo/sg2042.dtsi      | 303 -------------------
>   2 files changed, 305 insertions(+), 303 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> index 94a4b71acad3..509488eee432 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi

[......]


