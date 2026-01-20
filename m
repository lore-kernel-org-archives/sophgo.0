Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DD244BC8F
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920220; cv=none; b=ZYcmp/bcL/M3abVgkemzVad+t/Zx08JQML0Cv3+CB22f8WVXHB4t3skQIRJaj5DEjL1I5vhRNOIEQ3BNKNT5Vt9BOZmS7VbbW527Puxq3RO/o79Zf6Ef6CvHTLISOtnJp3UjPuSac7EZziWfgGmHbiBik4+RwMscqSCqrE9/5C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920220; c=relaxed/simple;
	bh=JKm8v5gQghaPXU3hhx0iZpbdqTnozchlbnx97d9bBLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEMcNo7v0M407SXI3dKp9/OpvoHdHjQ2i1YA45QdGs4pX+PJuhCivcgoTPpyomBlkzG+TV2+tBn/znGyHER68TtONRGh+fbZSIuncGcKWGLseL+Y74MUhnIoPYmWPtgTcfOiExJtcp8kh4C5EhUwCS90lneeit5Z1lQjYcamrWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUoDryqH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUoDryqH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso37383735e9.1
        for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 06:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768920217; x=1769525017; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BBO7s0q0gk9yVOm/GXGA0GPwp+Pc4tuwtNZFcNdboA=;
        b=QUoDryqHdKiKTo5M4vvZRE7BjbfSdKE6634ED/Vtc0kqsIPXc2eNb4qOz7DQ1ouwva
         vpD0qUueDurugyOG3hM2YhBX0B894m+Yojm1RmcWWFSKY4TcMX+W5iyoJmJStFAMY0i+
         Rw2UOrn56ZL22IXnpbDEqAP2P95Oq5SB1pY4yzqC9vInCkFhcsKKZPWnt0Pi8dp7CeNs
         bSit4QzmSeLl5E6hK8UF3U2R8nslLamX+3DJt5SPWFf927AW2eUbqtfSyTyY4CHdQJsX
         QJhG6aWnhUY//oSM8B2i9JI8hyP+uIDIr+S9OKWqn2+WAAwCke9LiTl55VjMn9S3C35h
         hESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768920217; x=1769525017;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0BBO7s0q0gk9yVOm/GXGA0GPwp+Pc4tuwtNZFcNdboA=;
        b=eLK64x/jyCpwCt2qfX1x3zBNm1eMKXNMFL9w09rGbt354r5BR7dWVBs7IGm/eZfI/S
         wTCtfUosjMmEG4oWoQcOI2dEnkv5NQow0Gt6ExCdxDOS8Ft0DOI9LaO+PG7QLLIfDfNl
         +ZeFdkUimFkgMmPzCouq9x0TGr/mBTgKf53DABC0yjQUg9bOH2IpWV9omidmhPS20uHS
         cmkvq/+WhhVSLoRAEW4QiLJoiWPpAapG2084gOhH2oIh7yaP4736gyJ+JlNAQORCa5Lz
         EfTZ0esdovu1L/QS9nSnB04Jz1Wt5wK8YnOTtDRuxoWFkapaXazAKwJUyka6llMCtjE8
         buag==
X-Forwarded-Encrypted: i=1; AJvYcCWSLaHtHlIyh4h8Z2L/wZykki1d9boBELCtN7eSTvhv+3sj9NK+CsYukOtsXeTdVrQiFTd4tBY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhZ9wVsEbgiURTYx2w3i7HM7pb+u1PJ4avhVMeyZSMFXN6a59V
	zKHtD56v+v2DD4szw7kCEitRRWrsPUfH+n0TpWSbwpvlFNoIfkd+ciLF
X-Gm-Gg: AY/fxX5YgdmEl6VVtDR+eYNEABfxJG23TY6Ndb6Q17C2JIML8eK6zPfpuFQbiLNETBP
	agCFTCCXD5PA9U9B75Swan4BkVO2cZP4i7DWtwZKLL2L5f0CgxtRp4Bae1ycSirIHFe3pzA/E4F
	PUjpcnalduXwYhixUHjE523qo1zj2pyJ9CgcgQPMu53M4NNLvmYuo8T3RVY0UNCyLt4nQwEaePi
	3i3R9+L4CBZbcC1e9/v+K6lA8RH8ntxrfFW89TrSAk7WNrAdfHpVpyHnpPZtaP6KHo2jmddltAH
	HZvoud/SLpMCgY+6WVVaulXofvzZXKATGTb/PSX5XeJITs3LvpqE/ZkKIrmchtemg2+YavHrzSN
	kHzFNJP8Z3kXkAnDy0wnw6Smqj1M96okYA99kY7a1sUP67ljetlMwTIdGJfavSihvm7HO02KeNT
	C3ndLSJ9QHmfrRAzhsG2FuCy/Orc9tCc8QYuiwfMtQ6KzjvIkrls6qg6Y=
X-Received: by 2002:a05:600c:60f:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-47f4289abb5mr153488945e9.1.1768920216949;
        Tue, 20 Jan 2026 06:43:36 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4802dc90068sm192581885e9.7.2026.01.20.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:43:36 -0800 (PST)
Date: Tue, 20 Jan 2026 18:43:31 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
Message-ID: <aW-TRX8Bv60Aq-W-@anton.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
 <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
 <20260120-rapid-turaco-of-discourse-fe3fe6@quoll>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-rapid-turaco-of-discourse-fe3fe6@quoll>

On Tue, Jan 20, 2026 at 11:12:23AM +0400, Krzysztof Kozlowski wrote:
> On Mon, Jan 19, 2026 at 08:30:44PM +0400, Anton D. Stavinskii wrote:
> > Document the internal ADC and DAC audio codecs integrated
> > in the Sophgo CV1800B SoC.
> > 
> > Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> > ---
> >  .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
> >  .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   | 43 ++++++++++++++++++++++
> 
> This is not what I asked. I did not say squash patches. I asked to
> squash into the binding. COMBINE the bindings. We do not need multiple
> documents.

Oh that makes much more sense. Thanks. Will do. You mean single file for
both codecs. Combined description and "compatible" like this?
properties:
  compatible:
    enum:
      - sophgo,cv1800b-sound-adc
      - sophgo,cv1800b-sound-dac
everything else seems to be identical. 

Can I keep single commit for this?

> 
> Best regards,
> Krzysztof
> 
