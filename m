Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B0538B99B
	for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 16:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840982; cv=none; b=Z6iqrNtzrIgu6hBp0qmwSU9HLxiTS6Sa+0Jm4Xg9B3AXSxyQAKo48m6SMp9EmzMoUmJPe4BlVUiPFDRwH91uaD3DY9+7t7qgDtBbnJmVgS/vDMqzpngLrMLJqIdQDBcapwcNFdABnCb6hmNOGGLuzUuA9HyqF+4ldmxi9lf5shI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840982; c=relaxed/simple;
	bh=GIklxi/q1fiaSMZ8P33e26bVO1hSHIIYKKnrErHesIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GukJz0/5Bkv7qduJz+4VBSWujFX3PXAa8CWEoSDItkED549705bFhrpvxUUP0WG+lnrDGiAeAP+oy58/QKeH0ldmowC4XsU1h3RiHb1VFA4rlWycS4SHii0JxS8w8KV+ZcgPUP/gaisKY49lKW7tG/1xaHbgesG4oTfRDevACUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsKuRvUZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsKuRvUZ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so3995980f8f.0
        for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 08:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840979; x=1769445779; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE5BjCYXuBdt6IRWd0lb2DWlaLa+Xld6lMou1p1B50Y=;
        b=RsKuRvUZnBAWe07YZ98ru1vsUzyL3CYqkdmi7k5MfASs8CYkYEGcWIBabn2w1guZnk
         XL6uaZBZGeD71qzfrUKEMIJdIEa8rBHqnh8OdlPttv+nWUV/Ui7HHL4z0lQh1OgABASV
         Ifray4Tn5ioOZl5zDlddjlW1g+12CF61gSDwJ582n+gm8rWRPSJwufGdDmleeQkeZiuF
         voO78FQ+Vd/E8ye/7Oc9asBPAoeU/2OsTvSbhlRchT0nIW2hMER5H5rlAtT+yF6ERkBm
         OqxFQoRTT/A/5ieCcQKjwik/rgZ28IxImUpIf+ra8HgWWNqG94fqI2eN2le9sa7uJTr8
         fIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840979; x=1769445779;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OE5BjCYXuBdt6IRWd0lb2DWlaLa+Xld6lMou1p1B50Y=;
        b=Bi3nU3Kozr3JeFPcayZrnt1Im0QB+mD9NywoEzduFtpUH2QRoK5t1saSfSlrtBuOQS
         lTTNZb/hGy+8lh73qfvCq6bTd7+y6mtBBYTlojYOfytweHCpm1Wc64ljpQfJjvifP1LW
         wdJLBkOrp41I35zip2xB1n7xig/ZOKV3omlwkzvFfUwmE6gboPZqUyk5JO828VgxrFo5
         eTzHdxta9hbJoN01dzCYPjLSitKonMmHUFzceXD/fgnv/+IC2PWO878DIWL9NCOmHcJ3
         UCjXEJwnWLl/6BG9wmnxb9iSYW23978EXoIoJubgzMQsBRja/x/yzoMO8a3Hr1OyXFXO
         C08w==
X-Forwarded-Encrypted: i=1; AJvYcCW/+qXjEujkI/Q2Qa2C9RDxlSlmPoAwfqnefun6GAIKUtOXvBhrYj/o7Y5F6Eq3bmFcw5W6tOg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOtNjOBorXolxXfSVboPdupjzHIGjBuGFng7+c5zhJJFGiRznl
	Z3kBr1IKOEN1IWzH4DjDIGhdS5hdFvz3fOFnDd7oF3REBTJ7timc8UDA
X-Gm-Gg: AZuq6aJn1IaKLMS0Fp4p1Vv5c6QMUrF0EzOocco37rOrwRB3O+5c0tJgy1yUIk2Pqps
	8VKlOhq+vjeuYVxmOenWQ3ZwruM82FroGzeoKAsYlEfZmBhh98zPKwWDlz8dOxIAvwPHcwnxOXI
	/WrGI2IIOpdr/TdN92TklDMYkZG4nPhQ6ool6bRq8BVMJ+qNpB3Nq68mYTUMuN6M3CHhAeKwilY
	vJfesVz+KkHZUp0J+n0A7CAd9RUMQTqjSpk+oW8sHPbL7C2HqAlU1zixKtdBSDrB7x6xvJhylA7
	H+23atyfYSWpJQrImzuqh3OIqpNJs/Pe24fNweWV6gW+GrKNYGZS59ME7RzknFJZX/Q/3urgQAD
	gaePrgsboc6K1kHlKql4Ne9mtzG1BXtDZCFWx9TKm6AUHMDBPVNoG0jie+t2cbpyTUKgNzbc6Bq
	HeMdFDuHMC2g62oZ3iazDglVAJ5xckruPvM9//TeOMKhQ=
X-Received: by 2002:a05:6000:2307:b0:431:5d2:4526 with SMTP id ffacd0b85a97d-43569998dbcmr14869350f8f.19.1768840979260;
        Mon, 19 Jan 2026 08:42:59 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6dasm24493290f8f.32.2026.01.19.08.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:42:59 -0800 (PST)
Date: Mon, 19 Jan 2026 20:42:54 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
Message-ID: <aW5exOoNcVY8EYON@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
 <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
 <af0d60f7-9566-4aae-a349-c01fe0220663@sirena.org.uk>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af0d60f7-9566-4aae-a349-c01fe0220663@sirena.org.uk>

On Mon, Jan 19, 2026 at 04:36:43PM +0400, Mark Brown wrote:
> On Mon, Jan 19, 2026 at 08:30:44PM +0400, Anton D. Stavinskii wrote:
> > Document the internal ADC and DAC audio codecs integrated
> > in the Sophgo CV1800B SoC.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Oh sorry. I didn't verify good enough before submit. Will fix. Thanks
for pointing. What is definitely wrong from my side. 

