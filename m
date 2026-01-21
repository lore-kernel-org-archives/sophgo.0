Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A1F48BD37
	for <sophgo@lists.linux.dev>; Wed, 21 Jan 2026 16:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014329; cv=none; b=pWDZQ/P8z0Bae8OiZXkHSeCDq7TfkGtx+6spbQtKPotVxliaHX3njPzL0KovQK6+oh9iT+w9DJ4ZbGD4WfAGOPt5pak46Ud4MO7yx9lEuN1PFHKd29vx2Bo3DKMDhiLK6CLziF+83Dx/Uv70RdeRw0Tb1eA1Tkb25C4hlIVEWGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014329; c=relaxed/simple;
	bh=4HRBjG7A0xNa2ZgGS4Ah4wBKvv4emyEssJAWSX3yqrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6ZLrlGnTesXG5RflXPu41ROVc+kyG6JOTUSNKxWL/NQAvqZvu2tDE7a0Lf5ylUciqE/IyFE89QcrfD1V4YcjQwTMn5G4vRMpOP1J9iFfMvtdMVVdu2dgEFewhAOTmFH/upM80m+p5hDh+nBNcx6hNHw1lg/TwwiKb2H/CYqH3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7gbEORF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7gbEORF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-435903c4040so14559f8f.3
        for <sophgo@lists.linux.dev>; Wed, 21 Jan 2026 08:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769014325; x=1769619125; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihhUfgSz7A2yaxp14lt5kXBlvsJX0TtPumRcsY55W6Y=;
        b=b7gbEORFEHQ0K92uJv77vjAZ+27xcAgLryiiZyLYGrPseiQPvrLILHdcUvMsuOZDca
         +C2m6XOaoFk9tK015hGr7phn3ndRgr+7S7DYdLOQmZa721wSDKYq38YW8n6/aL2vhlCG
         egUR29w41A010riQnkJhG8i+qOZzkEOqjiwLy0W0PVJ+Bk5BOXuz4MIJlOwS8GhW7lkq
         0/2fK483zgYzOTG3zQVRAsGegW5wubqATwYX35xxaZDc2xd5Kz3yWEMUCgtwWsfdxux1
         afRIafUADizRC2DD3NQAIQ7FJeTkPl/ELNF6CECshyUsTfIMOLhIW0suiXyZe55RY1CB
         Tatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014325; x=1769619125;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihhUfgSz7A2yaxp14lt5kXBlvsJX0TtPumRcsY55W6Y=;
        b=aewG09x/skySDYHFlZfEfkSEroPU8JcL4xY9TzhgjfqWp+ieLTOTu0T8pENQMyx26I
         sPX3q3YfwnJAUkunTobXaf09IVz0r5QZ2I19Wtuyh/5it5GNhuWtrIjPfEHOsuF542ZU
         9E/ATvD/rJppQOJ5RpOrBv+vBfkvaiQrv2xiDAkQ8tV9xrT+swpgwun2ZJ2bPX42e5xA
         ssZ56SGCZhjA1lXeV5qHDEkdKbxuUETFlPb1HHtb6xbUrOy5FYJ4KVtR/eIEsohnjtLS
         XCmItmvycm/BTjGwVWbJe//1LEoU5DyHOwRZaEn2TNuQlPPZXPh8XnKpSh+AyGzxyh/0
         DsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+BUGP+HOkeSdLM78fPpMIAI4/Pe2eXkopVFszj2vgiLYxX80CMzhTelZoA+HbfBmDSXigCJQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz32l2aIXruVL9fpEpPxdtIbi9nqahF0ENvDenx+wPrncm5o8+E
	u9FysOotf3eazd7EbhDB6HKixnGpYIywPlbzF9vluJ47QVaggX+KUIHt
X-Gm-Gg: AZuq6aItfxnyWnN+/6yU1ThrZexw75iRyM3rdMdt/1Of8J6hAPsVvhT2qYLGcQY+LD/
	5RI6yWyT0tZvlTmZXfwy6dOyaOVmIL1g/VXnWf26Ix8QmQSkbw3LUx9OmcZCQhMzl00ecqjx8Un
	i6v9ifE2PzGRptLPM+sq1yODD8BmIUnDnHvdNfbpxLe/fC6A2RrJAGn7jXNTYUrODQWrCrIa4N4
	L2Na1/yzzJXLR57SNtnDClQGhzRO3g0lVMuXPEnnVfmIwEnt2YpMXTPD4WxvD5CeTW+rrAAVb/z
	8ZB39vJmU841y+3SdtB6Jv4D3Rtxtcdz5hYUWDj/TevVITSWitwXdmDVk5bihqhgGDPnqlT5/+m
	b2GqKQNB+PI1tyC9YzsPa8jSE4OKaWcp6Q1DKVWJ0ZEMBHU5OVJYpv6WeTm9SRAN24XnJZ8E2yY
	oWdx4LPP1gqGbC3KTooMA9MMIRhtJXIXIpMSejmc/tjFca32cPaoEGpaY=
X-Received: by 2002:a5d:4a88:0:b0:431:764:c25d with SMTP id ffacd0b85a97d-4356a053cc5mr22591618f8f.35.1769014324966;
        Wed, 21 Jan 2026 08:52:04 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435924ae723sm11119706f8f.41.2026.01.21.08.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:52:04 -0800 (PST)
Date: Wed, 21 Jan 2026 20:52:00 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <aXEC1f0gy64FY_Pl@anton.local>
Mail-Followup-To: Rob Herring <robh@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
 <20260115-cv1800b-i2s-driver-v1-1-e8b22b8578ab@gmail.com>
 <20260121163213.GA3413426-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121163213.GA3413426-robh@kernel.org>

On Wed, Jan 21, 2026 at 10:32:13AM +0400, Rob Herring wrote:
> On Thu, Jan 15, 2026 at 11:17:38PM +0400, Anton D. Stavinskii wrote:
> > Purpose: introduce DT schema for the CPU driver
> 
> Please write a better commit msg. Use complete sentences for starters.

Thank you for the review. But I'm afraid this is initial version of the
file. The current version 4 is here
https://lore.kernel.org/all/20260120-cv1800b-i2s-driver-v4-1-6ef787dc6426@gmail.com/
Hope everything from what you said is already fixed. Big thanks to
Krzysztof for reviewing, help and patience.

