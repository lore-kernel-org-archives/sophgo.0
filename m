Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B4623D7DC
	for <sophgo@lists.linux.dev>; Thu, 21 Aug 2025 01:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755740131; cv=none; b=JS8FhyfUkVqFGCJsM5chyYFCW1DSRe1vCT/hljJ49qFy5gi8kjVUIqpGz8XdWvbcXNLhUqkL2i0WkKEjUGXoU8acfIHRygQnMs2gHbxBS4vYPeDTdyi7OrzCYo4H+zEbqyCoEmXIUAxv/YmX05pOPIMDPMbuQn0hnF79xiPqOx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755740131; c=relaxed/simple;
	bh=53nl7e/tLAgas03Zc/w4tDqWdhIfGYbm3/bqEron9x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnMad90suqoCshyektAGyofurqMtcwwuSrz4xZVyWj6kKryG5oEN3TWTA/RgdGh1Vo7pRh0AYo9iS5utpakg8VNMIC8QXaQAIqCJZIuKYRgtNGtdCLUyiLgRcKClKPuDz2HvAsRmMKXSHBmkK4CHja8XT4HiIaXXiMtUVWTf5sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=pLko14EW; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="pLko14EW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755740115;
	bh=4i2PKH/pkBlK7p/kcJ9sT3KN6EegL/vQ+jD+W2is93E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=pLko14EWFnUitMPhOwR5QjWNUEwJTzJo1D0ZauX5sD6U4b0sS7paq3Y627nGJTpaK
	 Gm3RrEixto98ZTEn3dl1KSBMBaYYBPkponw2rrTf/ORQjMU/NV1x8i7m4at6W58arf
	 e8gyH3sohZb0URaY7S4MNHECLIh95VjV7RVRU6q0=
X-QQ-mid: zesmtpgz8t1755740110ta5c2e935
X-QQ-Originating-IP: +FxJ7H9nhcYGojFKOawCdDolbd6zWoQ6jpGoCAUSbgU=
Received: from = ( [14.123.252.18])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 Aug 2025 09:35:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12836128371367281167
EX-QQ-RecipientCnt: 16
Date: Thu, 21 Aug 2025 09:35:08 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Zixian Zeng <sycamoremoon376@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: Enable SPI NOR node for
 SG2042_EVB_V2
Message-ID: <9E4A44D8F7E9454E+aKZ3zCxTMq10AYqM@LT-Guozexi>
References: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
 <20250813-sfg-spidts-v1-4-99b7e2be89d9@gmail.com>
 <MAUPR01MB11072CB6BD1EC94B752AA1F8BFE34A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
 <aJ7Q5tQ3oa8DBpfO@calculate>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJ7Q5tQ3oa8DBpfO@calculate>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MlLPmZJvbmDx5u5kNeaRfN51VlN7njDagzBGQ7TUANIgB5F3H2PlWYRN
	FigmRfkmT/tFYHzME7rKvEsRTrghGqcFH8HYgeQ+FlfX8bf/u60novtQJF8L8in1MZYR1Tx
	tZT7qaYmPT4a8CxD83lXOZOPTPDe4ZTfW946no7XCaa0gGWXBhUgHgvNpJm9IIB9YJFt21I
	2Vk0HLJlkk5ffiHN1RotadAQoiArN8LGuGfwHBeBcQI7w/K+iyo60+mt1m9w7oowkQsB3/1
	C72BTzFuh2Du0eVdZh+C6YKe45/BJAqpQvwJekdWPIUxEESi3QEK6rzk6Zhp7ZsFCX0s0JG
	Ql+wXS7QhE3iMXM764KcdO0KWBdVGvoYPOMlmFCoRwp9FqnDEJwQIR9bL/Ti7avysFXsOGP
	OasQ09C1fq2FygfMclicf21xElkWf/j/3gGPVao3t4bUZTGIXtcjV7ZNWIdcwlIihZNrWOb
	hX/lV8lYNvTH6cPwqGy3Q5Ta/nSFvlIysjsRjS3UfX4zUGk2ZCgZjSgfBJk1Bq5OAPwRTpQ
	xwuiZB/uk0UIih9RcOkzZv0DkHndZAt+P9uZLX3s1iSj/jkmuZOx11eHIYrdJS/nMoFpmk5
	vINt4oFllBkVb3fouGuPPo5H46aRUYlKyYhQQr8ndktak9uf3fhr4yhaBxg0F74TJhY/jDx
	+z4JLup3P01cNbDgcMFY4uGip9SS0vk5JQJDDHxq1QtpTRNvKD0ksF/KULkOsQMCkEQtwCn
	qKPMZNKLOExAqRusruc8vR5+rWO2SUjgwbw2ePW5DCbDCb7KuGr8e6vN1Te+iqWGkrD6yrf
	RIOZ77HQW+/fhXCGU57htJ+HKj0FDuZjD2RvMTbgJxtTFDczx2kwHC0Q9W6tu3WckLCsXWR
	/RpC7oFmpvtfRiULkEm/SuojGDYs3JhExetkZUmjhm5XZ++uyzWunSwjywFpQleAlSBI9PZ
	DYJSuE6SZ7Kr7HH2B0YpBm0SAn+kdTNu4m3MkW52FvuAo1MjV1HUrC168VtWDE13iKq3sl6
	ypiPlZ26HTL0ODrheTE+BP5XPwXJ7Ice13aeMDK7vLt0/S029Czm3YnWI1LDQ=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On Fri, Aug 15, 2025 at 02:17:10PM +0800, Zixian Zeng wrote:
> On Fri, Aug 15, 2025 at 11:56:22AM +0800, Chen Wang wrote:
> > 
> > On 8/13/2025 4:33 PM, Zixian Zeng wrote:
> > > Enable SPI NOR node for SG2042_EVB_V2 device tree
> > >
> > > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > > Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> > > ---
> > >   arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
> > >   1 file changed, 12 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> > > index 46980e41b886ce17dacce791fa5f2cef14cfa214..7001d8ffdc3e04c5a5cd5da85a4fb1c0351eb9a5 100644
> > > --- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> > > +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> > > @@ -226,6 +226,18 @@ &sd {
> > >   	status = "okay";
> > >   };
> > >   
> > > +&spifmc1 {
> > > +	status = "okay";
> > > +
> > > +	flash@0 {
> > > +		compatible = "jedec,spi-nor";
> > > +		reg = <0>;
> > > +		spi-max-frequency = <100000000>;
> > > +		spi-tx-bus-width = <4>;
> > > +		spi-rx-bus-width = <4>;
> > > +	};
> > > +};
> > > +
> > 
> > Only spifmc1 on EVB_V2? What about spifmc0?
> > 
> Yes, EVB_V2 has only one spifmc1.
> I have checked schematics which can be opened by OrCAD:
> https://github.com/sophgo/sophgo-hardware/blob/master/SG2042/SG2042-x4-EVB/sch/SG2042_EVB_V2_20230302A_BOM.DSN
> https://github.com/sophgo/sophgo-hardware/blob/master/SG2042/SG2042-x8-EVB/SG2042_EVB_V11_20220902_BOM.DSN
> 
> For your convenience, I have exported them to PDF:
> https://github.com/sycamoremoon/linux-riscv/tree/schematic
Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Best Regards,
Troy
> > Otherwise:
> > 
> > Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> 
> Thanks for your reviewing.
> 
> Best Regards,
> Zixian
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
