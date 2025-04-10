Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D663433BE
	for <sophgo@lists.linux.dev>; Thu, 10 Apr 2025 00:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246340; cv=none; b=TlCuQ06H9Aj7lmcE580iZtLoDq6q8ZSW+s/S7MSJHMnZfAD0xKAxfROBo28d3gXiu0ydG3f3HyKPzR/0YA7Cx5zjM/FKI2B0PXyn7QPos5Q6h5H7OLWDgRx/d3KXWMN6VhTTr9v1fH83ZGzCrpgTTctkj9yAnYTmoROp0y0ENd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246340; c=relaxed/simple;
	bh=ox8AgQfTLVA79rJ46te13DbxlMU54VNVSKxdcc5HLFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zavw4SUtnlgQtUJtgshhhSNZq9z76UzVCnIrVL6gCc0MZVoinIQBQLAsz/XJumFyhfXDOFnimgNNdoEf2YeO8wF5+AA1o7oZr9wgu6RG9Pwl6XrjXQq9GVjwE0iHEw1pE6cvz1xxKH1iOVSY+pKpWaDIXVjHAhuiFN4cXzNSOF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kA0AgUCw; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kA0AgUCw"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4767e969b94so4035471cf.2
        for <sophgo@lists.linux.dev>; Wed, 09 Apr 2025 17:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246338; x=1744851138; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fs2WdD/B26OtprRfRLTt0LpyKmz5rmP8V5F0HnSmXgk=;
        b=kA0AgUCwrD4Esn8VyuegimEW+wHMeWWqlOMAlOLTrTTDAla3WJlA3WdsgdlkWDxrHE
         m9pw0Wvj25wtPA1ukIWph/U+hPmX8j/5YCAOOIxwQHqnZUCTp8ooSbQxg7dd8QuTplep
         CYk2cugqSYRLdZ1IRYAjBHzPL/3pcs01i6UHM3cUQZPgKZchSIP7zzrQW+vb4sWCECST
         P7zEcRtLb47INOSGwZB2+MnBrisTDLFpaqN5psppnVwAzTo+zunGBASBtKip3vMYw3lZ
         Pbjn1+FtVzsvdJVGj8fFcN53Nnq09Q5B/9i8Y4kNfl9biYi+hBWCSVnCOMPQPDhfOJ/a
         Gquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246338; x=1744851138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fs2WdD/B26OtprRfRLTt0LpyKmz5rmP8V5F0HnSmXgk=;
        b=BY0UUFKQFvH+5rHiX4+Qc259ynFA8ilmnqlYfrm+fES+7yeDFjkuJXOflDHdFsSzgl
         KSgqmUPlP4cO9OH2FgXetXl/wkwxsmf8rLnh6V0iLMXMzOioGTugvu5y5cEqLixh0mG4
         On//TySudY5WwRW651vwlBbQAftTlnSEAy5C8XeNgWsoSd98llWOvKnViDFSVYTFV3LO
         pdFS1s6ys1hcLSTA+GmAcT4JM7X0ase/HEpxlg6FP2sbB2iggm1/X9rtzbH4JqQo3s/j
         HQOUGWVIca2myW7B5x1uGAVaqOXc6noxMzVUIov/oS6ZjzE0coygKzkGjteia1GCRiCG
         9gRA==
X-Forwarded-Encrypted: i=1; AJvYcCW/yNDZHWtCceu2OGnttLKzqHU6ZvyLMiKDI079eE6AvupKZukYtQAaBE0TDWmeD8oB3QZyMTM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrvcNzcx5Yy42bEk2igs1XS3QC/4qxprjHg6oL2vZmphadqvoH
	l2JSkdG6bnARu/gWLG4RJylXthBhY8/UowAwTTZ2MhTGR6CUGj97
X-Gm-Gg: ASbGncsMr5GUlY2f4Y6ZG8oWoBwDWx7Ie4fyr7Yrt04sAWO1Uo7eKk95/xQplYCzNDz
	tRGggc2F/eHvyqWMUzoZipz9T9KO8ma1qwYUYSTezBRDJMSiCdbEY44vJvEy3EpqHXBBOVPO/RD
	3r5fbKEuRm+UXT9WydaDC+EyYuu5t3y5Za2ZuGZjBPxx6dhr7TZ1pjQ4qEk49YcngT3WQ1Wjs0S
	Tm3MUGJOYl1mRe1ce7sjcxChP9M/K3nbsM231RpI4jbGov0vwDevGUsNAY/nhbObW15t+I3xQEA
	5mOOx4vm2dD1vxIF
X-Google-Smtp-Source: AGHT+IEnhl76pykbQfzu9PnuA4q6SybzAfrF021J7S6C5p2V+BNkLwoJw+XTI0wnALfnBZwhQfCB5Q==
X-Received: by 2002:a05:620a:f0c:b0:7c5:4cb7:ac97 with SMTP id af79cd13be357-7c7a76546f6mr145282785a.1.1744246337937;
        Wed, 09 Apr 2025 17:52:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8a1c798sm7515285a.116.2025.04.09.17.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:52:17 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:51:39 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 4/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI
 interrupt controller
Message-ID: <fecggqyrkh222svtcudqoemw4vzisa6srod4jaumkrgd7xrm7j@vfs7xs5fo4i6>
References: <20250408050147.774987-1-inochiama@gmail.com>
 <20250408050147.774987-5-inochiama@gmail.com>
 <MA0P287MB2262DBC84878347B78CA50ECFEB42@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <87o6x5tbev.ffs@tglx>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6x5tbev.ffs@tglx>

On Wed, Apr 09, 2025 at 08:52:40PM +0200, Thomas Gleixner wrote:
> On Wed, Apr 09 2025 at 15:53, Chen Wang wrote:
> 
> > On 2025/4/8 13:01, Inochi Amaoto wrote:
> >> Add support for Sophgo SG2044 MSI interrupt controller.
> >>
> >> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> >> ---
> >>   drivers/irqchip/irq-sg2042-msi.c | 61 ++++++++++++++++++++++++++++++--
> >>   1 file changed, 58 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> >> index 30a1d2bfd474..2935ca213306 100644
> >> --- a/drivers/irqchip/irq-sg2042-msi.c
> >> +++ b/drivers/irqchip/irq-sg2042-msi.c
> >> @@ -19,8 +19,6 @@
> >>   
> >>   #include "irq-msi-lib.h"
> >>   
> >> -#define SG2042_MAX_MSI_VECTOR	32
> >> -
> >>   struct sg204x_msi_chip_info {
> >>   	const struct irq_chip		*irqchip;
> >>   	const struct msi_parent_ops	*parent_ops;
> >> @@ -44,7 +42,7 @@ struct sg204x_msi_chipdata {
> >>   	u32					irq_first;
> >>   	u32					num_irqs;
> >>   
> >> -	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
> >> +	unsigned long				*msi_map;
> >
> > Regarding the common parts of SG2042 and SG2044, I noticed that you 
> > changed DECLARE_BITMAP back to dynamic application. If there is a next 
> > version, I suggest you mention it in the commit information.
> 
> Actually that should be part of the previous patch which prepares for
> configurable initialization. Then this one just adds the new variant.
> 

I think it is OK for me. I will merge this change in previous one.

Regards,
Inochi
