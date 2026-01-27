Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BD832AAA0
	for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 18:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539885; cv=none; b=cUm3GrfOfxDMHZkFhlQ/kXBLWdHLjWm2hTN+Ft909SDhhL/01oXehCXxGXW03sZhWb+prDIQK9dndMStL8qHWOWtEMVcgIXRunvfrdRMFlakD4w2xhVwNizGv9OmnobyM4bVmmLLKEGfT2/qX85iayQD891aqMLL2eersmHG7RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539885; c=relaxed/simple;
	bh=qArAMpZJ4F3qlkiildbqPjg4dSjEqJxMkuCNZ9Sgzbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCPbpW2/73v/nLNdxNJx2nc0GASaPgg6HLJzYOVbHhUxL0JsX4rQVCgnPeZHq14hzHqhWT8i4NvHhAKhjToiYV8IZSu3PvoqZx5yDoHh/LlPwN2bNNokQGJRL7rCYftniimVLs4KKEjbin460G9cUBgGsBZaa7O7kA280U73YzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvB8vdw/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvB8vdw/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so47074045e9.0
        for <sophgo@lists.linux.dev>; Tue, 27 Jan 2026 10:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769539882; x=1770144682; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkNqmPn4BV41VYFQxjkR3+9fZTczW5ysPjEroCIQMPE=;
        b=YvB8vdw/pzlPFhbSpVD0iCWvGvtDhYLlaUVbNfhzEUG7uNNaksC1M/njR9hJTBFI3h
         sO9IoROGSmrpo+A4R/1NI4+3yNm9TVQ3hZduvcICcCk6zEZkS2uZLhBdjb9yHhugygJX
         4J02C5IW+yJJ4aVUt3UnHzoj9I07GH4I92VdajdBdYrK8pA52FZaRhjoi6QsejSWnzGM
         Evu3DzUrYKfWRZiO5ZdjPzf6GfN5syFBx51t5XGKzw3vc+Pke/ORpKL3VB3jb+U24zaa
         FhPcTzTa6YK8/W+FEi+UMkaCFYfvN2Qm0EayqztdrBKn6ZZCUYo48XpieSDgRdusve/j
         X+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539882; x=1770144682;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkNqmPn4BV41VYFQxjkR3+9fZTczW5ysPjEroCIQMPE=;
        b=qiV7WNOCDffEA+6UYFegfMPxj7ptwArDeg0vlGqnaJfDuECSSwkOOoDYokY4KEnJ8H
         BFnSoXZNzbIIfAx/o+8Zytv9+RhpAwDp5ORFnFwy9qJC4fmbtQokmdpw2MOSprE18qYj
         PIQkIrdi7o/gQ09Swvs1/TNbHGhlon4lyqmMOXeIq2QYQ7Ty1MMEXpsWjWMjIcCa7OAN
         xIzZoHQMectoc2xjxlJP5Ivny2FRrfIiQCFl5mOLuCOhttB+CU4UWrygABUUC6giJmQd
         YI+IWzYxUufvJLmj/1sbybMJ5VFpJXQfHPNgjbNe6sKawm7yWUqoaoKI9ggl7o8yE9YN
         bH7A==
X-Forwarded-Encrypted: i=1; AJvYcCUvu9Jnkj9Dp++ayb/6PAXFQgT1CAwQp0cRddUp3oeUm19KNDBUvTIWsjI5KDbWL2xF4uIH1m4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPjwduLS95wnh5Xd33EfT81FQxy5QoN3WSiTXBpc295IW3CPqZ
	oxeTamj7+bjm+2bn4osSHmB1L1SDIfNX/8/qnyhLGrXb+LPe/02Jlxzg
X-Gm-Gg: AZuq6aJjQIbqAj0gtHV3yEiqGco0LHmuvhedAQrz6CPnpgEwh93zgwrqKw1fDpEWpKI
	vKniPACb1p7FWF5SIKZ1+eW221bHdSH4gc2SArSn5qCcB7QWhYcehjO+DCDB+HGP3dpxKCXrxOx
	d7iEo3//y4jNnShUJserhy8KA8EeqWlfLQSWm3CGfSRa5zr7V+PDBhXhviGbgIv8cHi7a9uN9sL
	UepLvgj+RF+9PM27OJpVbQYeoFlA8IJBVFc+YgHmxmdO6tJUDFktYHY+D/SKQV9RG6fXKQD/oZk
	3LImtKXj5Nw9AKN9+U2EllY/toSVF6m+bntrCGlWXy37NJY3Key7jwD8Ld27LDmHlsC18OswF7K
	zVqhX39B5D5gQc5pxENPSuLEVznS8Sn2DLf+zgaj7NNp3qCsjUXKcJ/28H1B0jsfUvxfsfOVO20
	WO1PbDKkYtk5w75sFvF3EoPXVb2Eb3sKwJ3XF8bR9DUJh/yXZkDztfU+4=
X-Received: by 2002:a05:600c:b8a:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-48069cb8baemr40072695e9.35.1769539881833;
        Tue, 27 Jan 2026 10:51:21 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806d255f81sm1827095e9.4.2026.01.27.10.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:51:21 -0800 (PST)
Date: Tue, 27 Jan 2026 22:51:17 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/6] ASoC: sophgo: add CV1800 I2S controllers support
Message-ID: <aXkI5jnCEb1SLnlD@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <50b16e42-2621-46d9-bb3f-5b4ea20aaaa5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50b16e42-2621-46d9-bb3f-5b4ea20aaaa5@sirena.org.uk>

On Tue, Jan 27, 2026 at 12:50:34PM +0400, Mark Brown wrote:
> On Tue, Jan 20, 2026 at 11:06:02PM +0400, Anton D. Stavinskii wrote:
> > This patch series adds basic audio support for Sophgo CV1800B,
> > as used on boards such as the Milk-V Duo.
> > The series introduces the I2S controller driver,
> > the DAC and ADC codec drivers, corresponding DT bindings,
> > and DTS updates to wire the components together.
> 
> I'm going to apply these, but there's a couple of small issues - please
> send incremental patches fixing these.

Hope everything done correctly here 
https://lore.kernel.org/all/20260127-incremental-for-i2s-dvier-v1-2-431b809c632d@gmail.com/

Thank you very much for the review
