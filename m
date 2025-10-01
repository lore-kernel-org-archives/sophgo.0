Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED61972617
	for <sophgo@lists.linux.dev>; Wed,  1 Oct 2025 06:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759301241; cv=none; b=geR2asemh+m+6YEcehDpOcPX7nrtIHIaMKoUhpG9WV2ENHioksUKc3fRzTLIunDNDrlJEAKHvYF+06qz2nYvRBKK6Ah5k1Gxl6fHhBMgPD29Xf+duO4m//Ug0uLY59orxfZxBEv2/S3Uj5NJ+lJQX7sMqDOeyv9mrTrGmqf5CA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759301241; c=relaxed/simple;
	bh=oq5an/fFkig8qvVoZG7Z4PYEyXusdmyfEix6wDVL5NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT6MlRaDFd5WsTVqUcA02c6Ax1bABJm9+k5LANXqWbyt4utx0vgGJq3LSljFucGfawsKSsVYXEasJBzYXXPe4JeKoPjRjKgLN/iupNfL0Rj5+WfpHjYa7H8IUx0MtzNq9iDXsAr0CMLE9EunKbD1MqGGfE2GTnl6KmMTmiz6/Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQ+gRBrp; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQ+gRBrp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32df5cae0b1so8094529a91.2
        for <sophgo@lists.linux.dev>; Tue, 30 Sep 2025 23:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759301239; x=1759906039; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rrg8YiOupFAOsk+i3SkSSloZ647XAd/cSDAukzzjg7U=;
        b=RQ+gRBrpjcFa65DoKqAMShDRtWktXhSxycNngkCm73iJCJM6MAi2t95L08uTEvC5Pc
         FW7CsX2eR5exAmyOp3iX8xmb42kCkJ8HdxcOg3afOOSTjPu+94uW9qUQVa04qf5Tjitz
         2NvfO5Mt8RQwZ1EWxofP5Izq/PvCaNBJa+lmRu1cGSapohO74/pXLTlhVZ4BC4uovnBL
         IWSQYLNZ2/y2YqjsQLYdsetXESmXbfvN1/t38TXZXnA1h556ikO9Aju3QVSFRWqiD37R
         559BeDpYKU4BsHYLj50cvpmOPnUeLBCseI0lhqvCHSUGaqe267z3ZmmCDXGfdLZ3386+
         Wv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759301239; x=1759906039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrg8YiOupFAOsk+i3SkSSloZ647XAd/cSDAukzzjg7U=;
        b=N3A9b5BfjnmelfGMssifPg/QL1PC5WHKGcxImAtiMgt8l/9mR+9rj+sPNzy9I5wwDh
         VvVcBSDeC0sByv2BwUCRlq+hylx7mrwJPFmAfMF6SKx75AgekTK9nkYtf46vWJCCCfdw
         k0N1K83yFI2OWsG5Sri+EPfqf4eyjDxDywHxk77By2Xg3tAalpPhj/e3iEMBP8yUxcyM
         nvm3aEkEywMUZMDORUZ+eeqPzlhgSoUmGiVuPYKWuhnIlcXul/+oy+cf3t4vgJ4VFajL
         KmPPcwAyL8QPiqVxTX0JnESXLmtItSXN4ucXIMdtOADupigncYkXWtqoIaPPChZqd1Uz
         Ueag==
X-Forwarded-Encrypted: i=1; AJvYcCUoMNf9dSVNqEnQePsQ2/sYeG5PymS+Qh7N7R5vjriTetzvl3Phh0WKa71YXPVIiBimMjx0gOg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuTwKtsyVO/Zczu9jAvv90fy/qKCns5q/HWMrKMHSuoPI7ZOD+
	UBb9OIinNfGky+xNgoTYfgJySbxvJzr7XUaRzAtFuu6lo2DSzRyNJrdE
X-Gm-Gg: ASbGncsphEQk83vI1OttjgcHC9D+j4iZ+IzMrKWqdW7vLDJI2LHWTDnCs4Jihtmba91
	9Je3rKTUHu0ESjYNFhcq1jhcxgb+3cqTfgAsgYJmIs0plel4Dy3AFJT//b06QGs/W5mSwJd5RDP
	QUAnIshXmbbiELVcCpctx2recaqvIcMV2ZMMVAg1HT1PrMlQhiidTXacP1MiLG15c3CMnWL5BXG
	RHQaKQaNbVxB56UQ7krqZw+MSd3f+ZJP4/sMNmAkVhSbsOHx7C201Io2V3/3+efcWHxRK5pgiAq
	ZM3Dc8nMgMas3ggbXznfGAhBFaiVgNiDZsowVcfBVsZA1VN+LKZ40N+hHyGfIhoCC+2odg6FBoa
	VQBl1lH7vw76v5LrdwGFGcj4e9sUA9tUxs4eBtwOOHnxMOA==
X-Google-Smtp-Source: AGHT+IHqcjg7cX3i0cLBfYp3CcUQtOuDhdAqQoQ+5y0QHajwwC6YPvB0Ubk+8W/P1F9XaXoOJJ99KA==
X-Received: by 2002:a17:90b:4d06:b0:32d:17ce:49d5 with SMTP id 98e67ed59e1d1-339a6f06af6mr2501078a91.23.1759301239132;
        Tue, 30 Sep 2025 23:47:19 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-339a6ea0d5dsm1501579a91.4.2025.09.30.23.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 23:47:18 -0700 (PDT)
Date: Wed, 1 Oct 2025 14:46:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Joshua Milas <josh.milas@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <ik7co4cfasicx7ent3grhdk4dkvmdgtxc7jcsxwmkmmb46v42u@vwkayyqswv6k>
References: <20250927173619.89768-1-josh.milas@gmail.com>
 <20250927173619.89768-3-josh.milas@gmail.com>
 <nkzpfylhxyqf5u3bjlokhe4udgcxohbaanhwuofjzatan3iwio@45ljfquf5sui>
 <ad86009bff38ddae0b291d3edbf958ce6363ece2.camel@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad86009bff38ddae0b291d3edbf958ce6363ece2.camel@gmail.com>

On Tue, Sep 30, 2025 at 07:03:24AM +0200, Alexander Sverdlin wrote:
> Hi Inochi, Joshua,
> 
> On Tue, 2025-09-30 at 07:54 +0800, Inochi Amaoto wrote:
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > > @@ -0,0 +1,88 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> > > +#include "sg2000.dtsi"
> > > +
> > > +/ {
> > > +	model = "Milk-V DuoS";
> > > +	compatible = "milkv,duo-s", "sophgo,sg2000";
> > > +
> > > +	aliases {
> > > +		serial0 = &uart0;
> > > +		mmc0 = &sdhci0;
> > > +	};
> > 
> > It is better for adding gpio and other serial there?
> 
> I believe, gpio is long time discouraged here.
> 
> Link: https://lore.kernel.org/all/CACRpkdYErJH5RUjL+jPC5vnaqGiOqBwHsr0E42wOWrpBGrpS3w@mail.gmail.com/
> 

Good to know, let's drop it.

Regards,
Inochi
